class HomeController < ApplicationController
  def index
  	if params[:search]
      @nearby_locations = Space.near(params[:search], 5)
    end
  end
end