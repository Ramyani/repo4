class SharedLocation < ApplicationRecord
  belongs_to :user
  belongs_to :user_location
end
