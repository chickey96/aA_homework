require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe User, type: :model do
   # validations
  describe 'validations' do 
    it { should validate_presence_of(:email) } 
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password) }
  end 
  #associations
  describe 'associations' do
    # 'it' refers to an instance of the BasketballTeam class here
    # because we have not explicitly specified a subject
    it { should have_many(:bands)}
  end
  let(:user) { User.new(email: 'email@email.com', password: 'password') } 
  describe '#is_password?(password)' do
  it 'returns false if passwords do not match' do
      expect(user.is_password?('wrong_password')).to be false 
    end
    it 'returns true if passwords match' do
      expect(user.is_password?('password')).to be true 
    end
  end
  
  describe '#reset_session_token!' do 
    it 'changes the user\'s session_token' do 
      old_session_token = user.session_token
      user.reset_session_token!
      expect(old_session_token).to_not eq(user.session_token)
    end
  end

  describe '::find_by_credentials' do 
    it 'finds user by email and password' do 
      user.save!
      expect(User.find_by_credentials('email@email.com', 'password')).to eq(user) 
    end
    it 'returns nil if user not found' do 
      user.save!
      expect(User.find_by_credentials('email', 'password')).to eq nil  
    end
  end 
end
