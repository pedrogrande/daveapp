class Space < ActiveRecord::Base
  belongs_to :user
  has_many :bookings
  has_many :schedules
end
