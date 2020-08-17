class Api::V1::RoadTripController < ApplicationController
  def create
    road_trip = RoadTripFacade.new(road_trip_params)
    user = User.find_by(api_key: params[:api_key])

    if user && road_trip.api_key
      response.status = 200

      render json: RoadtripSerializer.new(road_trip.get_road_trip)
    else
      response.status = 401

      render json: { unauthorized: "Permission denied"}
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end
