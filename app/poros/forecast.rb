class Forecast
  attr_reader :timezone, :currently, :hourly, :daily, :today

  def initialize(forecast_data)
    @timezone = forecast_data[:timezone]
    @currently = forecast_data[:currently]
    @hourly = forecast_data[:hourly][:data]
    @today = forecast_data[:daily]
    @daily = forecast_data[:daily][:data]
  end
end
