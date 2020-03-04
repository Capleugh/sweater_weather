class Api::V1::ForecastController < ApplicationController
  def show
    forecast = ForecastFacade.new(location_params)

    render json: ForecastSerializer.new(forecast.get_location_forecast)
  end

  private

  def location_params
    params.permit(:location)
  end
end
