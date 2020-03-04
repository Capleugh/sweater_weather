class DestinationForecast
  def initialize(future_forecast_data)
    @forecast = future_forecast_data[:currently][:summary]
    @temp = future_forecast_data[:currently][:temperature]
  end
end
