class Band < ApplicationRecord
  validates :name, :band_owner_id, presence: true

  belongs_to :owner,
    primary_key: :id, 
    foreign_key: :band_owner_id,
    class_name: :User
end
