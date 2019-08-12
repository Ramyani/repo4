class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_locations
  has_many :shared_locations
  has_many :shared_user_locations, through: :shared_locations, source: 'user_location'

  validates_presence_of :first_name, :last_name

  def full_name
    [first_name, last_name].join(' ')
  end
end
