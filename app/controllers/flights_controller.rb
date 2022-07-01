class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map{ |a| [a.code, a.id] }
    @origin_code = params[:origin_code]
    @destination_code = params[:destination_code]
    @departure_dates = Flight.all.map(&:departure_date)
    @date = params[:date]
    @passengers = params[:passengers]
    @results = Flight.where('origin_id = ? AND destination_id = ? AND departure_date = ?',
      @origin_code, @destination_code, @date) 
  end

  private

  def flight_params
    params.require(:flight).permit(:origin_code, :destination_code, :passengers, :date)
  end
end
