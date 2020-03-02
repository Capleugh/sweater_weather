class Api::V1::MunchiesController < ApplicationController
  def show
    start = params[:start]
    destination = params[:end]
    food = params[:food]
    forecast = MunchiesFacade.new(start, destination, food)
    forecast.get_future_forecast_data
  end
end
