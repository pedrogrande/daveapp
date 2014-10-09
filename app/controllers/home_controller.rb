class HomeController < ApplicationController
  def index
  	if params[:search]
      @nearby_spaces = Space.near(params[:search], 1)
      
    end
    if params[:date]
      	@date = params[:date].to_date
      	@day_of_week = @date.wday
      	@schedules = Schedule.where(day_of_week: @day_of_week)
      	@nearby_spaces = []
      	@schedules.each do |schedule|
      		if !schedule.space.bookings.where('date = ?', @date).any?
      			@nearby_spaces << schedule.space
      		end
      	end
      end
    @all_spaces = Space.all
  end
end


# Find day of week from entered date
# Find schedules that are available on that day of week
# Find the space associated with these schedules
# Exclude spaces where there is a booking for the provided date