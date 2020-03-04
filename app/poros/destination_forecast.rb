class DestinationForecast
  attr_reader :summary, :temp

  def initialize(future_forecast_data)
    @summary = future_forecast_data[:currently][:summary]
    @temp = future_forecast_data[:currently][:temperature]
  end
end
