json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :day_of_week, :start_time, :end_time, :space_id
  json.url schedule_url(schedule, format: :json)
end
