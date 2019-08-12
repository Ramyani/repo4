class UserLocation < ApplicationRecord
  belongs_to :user
  scope :public_location, -> { where(is_public: true) }
end
