class Api::V1::RoadTripController < ApplicationController
  def create
    road_trip = RoadTripFacade.new(origin, destination, api_key)
  end

end
