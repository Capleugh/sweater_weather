class FutureForecast
  attr_reader :id, :end_location, :forecast
  def initialize(future_forecast_data, destination)
    @id = nil
    @end_location = destination
    @forecast = future_forecast_data[:currently][:summary]
  end
end
