# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'bcrypt'

class User < ApplicationRecord
  validates :password, length:{minimum: 6, allow_nil: true}
  validates :email, uniqueness: true, presence: true 
  validates :session_token, presence: true 
  validates :password_digest, presence: true 

  before_validation :ensure_session_token

  has_many :bands,
    primary_key: :id, 
    foreign_key: :band_owner_id,
    class_name: :Band 

  attr_reader :password 

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    if user && user.is_password?(password)
      return user 
    else  
      return nil 
    end
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token 
  end
 
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

end
