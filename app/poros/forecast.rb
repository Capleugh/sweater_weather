class Forecast
  attr_reader :id, :location, :timezone, :currently, :hourly, :daily

  def initialize(forecast_data, location)
    @id = nil
    @location = location
    @timezone = forecast_data[:timezone]
    @currently = forecast_data[:currently]
    @hourly = forecast_data[:hourly][:data]
    @today = forecast_data[:daily]
    @daily = forecast_data[:daily][:data]
  end

  def forecast_currently
    {summary: @currently[:summary],
     icon: @currently[:icon],
     time: @currently[:time],
     temp: @currently[:temperature],
     high: @daily[0][:temperatureHigh],
     low: @daily[0][:temperatureLow],
     city: @location.city,
     state: @location.state,
     country: @location.country}
  end

  def forecast_currently_details
    {icon: @currently[:icon],
     today: @today[:summary],
     tonight: @daily[0][:summary],
     feels_like: @currently[:apparentTemperature],
     humidity: @currently[:humidity],
     visibility: @currently[:visibility],
     uv_index: @currently[:uvIndex]}
     # maybe come back and deal with uv index (low, moderate, high)
  end

  def forecast_hourly
    @hourly.take(8).map do |key, value|
      {time: key[:time],
       icon: key[:icon],
       temp: key[:temperature]}
    end
  end


  def forecast_daily
    @daily.take(5).map do |key, value|
      {time: key[:time],
       icon: key[:icon],
       precip_chance: key[:precipProbability],
       high: key[:temperatureHigh],
       low: key[:temperatureLow]}
    end
  end
end
