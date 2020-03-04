class Api::V1::RoadTripController < ApplicationController
  def create
    road_trip = RoadTripFacade.new(road_trip_params)
    
    render json: RoadtripSerializer.new(road_trip.get_road_trip)
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end
