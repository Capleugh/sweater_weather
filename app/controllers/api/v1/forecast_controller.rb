class Api::V1::ForecastController < ApplicationController
  def show
    ForecastFacade.new(location_params)
  end

  private

  def location_params
    params.permit(:location)
  end
end
