module SpacesHelper
	def booking_details(booking)
		booking.date + ' ' + booking.start_time.to_s + ' -> ' + booking.end_time.to_s
	end
end
