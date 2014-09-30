class SpacesController < ApplicationController
  before_action :set_space, only: [:add_booking_to, :show, :edit, :update, :destroy]


  def add_booking_to
    @date = params[:date]
    @space.bookings << Booking.new
    @booking = @space.bookings.last
    @booking.update_attribute(date: @date)
    redirect_to :back
  end
  # GET /spaces
  # GET /spaces.json
  def index
    if params[:search]
      @nearby_locations = Space.near(params[:search], 5)
    else
      @spaces = Space.all
    end
  end

  # GET /spaces/1
  # GET /spaces/1.json
  def show
    @date_today = Date.today
    @day_today = Time.now.wday
    @days_of_week = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
    @dates_of_week_1 = []
    @days_of_week.each_with_index do |day_of_week, index|
      @dates_of_week_1 << Date.today - (Date.today.wday.to_i - (index + 1))
    end

  end

  # GET /spaces/new
  def new
    @space = Space.new
  end

  # GET /spaces/1/edit
  def edit
  end

  # POST /spaces
  # POST /spaces.json
  def create
    @space = Space.new(space_params)
    @space.user_id = 1

    respond_to do |format|
      if @space.save
        format.html { redirect_to @space, notice: 'Space was successfully created.' }
        format.json { render :show, status: :created, location: @space }
      else
        format.html { render :new }
        format.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spaces/1
  # PATCH/PUT /spaces/1.json
  def update
    respond_to do |format|
      if @space.update(space_params)
        format.html { redirect_to @space, notice: 'Space was successfully updated.' }
        format.json { render :show, status: :ok, location: @space }
      else
        format.html { render :edit }
        format.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spaces/1
  # DELETE /spaces/1.json
  def destroy
    @space.destroy
    respond_to do |format|
      format.html { redirect_to spaces_url, notice: 'Space was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_space
      @space = Space.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def space_params
      params.require(:space).permit(:address, :user_id)
    end
end
