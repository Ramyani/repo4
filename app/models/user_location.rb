class UserLocation < ApplicationRecord
  belongs_to :user
  has_many :shared_locations
  has_many :users, through: :shared_locations

  scope :public_locations, -> { where(is_public: true) }
end
