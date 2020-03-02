class FutureForecast
  attr_reader :id, :destination, :forecast
  def initialize(future_forecast_data, destination)
    @id = nil
    @destination = destination
    @forecast = future_forecast_data[:currently][:summary]
  end
end
