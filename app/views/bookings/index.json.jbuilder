json.array!(@bookings) do |booking|
  json.extract! booking, :id, :date, :start_time, :end_time, :space_id, :user_id
  json.url booking_url(booking, format: :json)
end
