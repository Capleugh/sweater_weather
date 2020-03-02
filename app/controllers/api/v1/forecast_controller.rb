class Api::V1::ForecastController < ApplicationController
  def show
    location = params[:location]
    forecast = ForecastFacade.new(location).get_forecast

    render json: ForecastSerializer.new(forecast)
  end
end
