class Space < ActiveRecord::Base
  belongs_to :user
  has_many :bookings
  has_many :schedules

  geocoded_by :address
	after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
	
end
