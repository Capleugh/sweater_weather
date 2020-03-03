class Forecast
  attr_reader :id, :timezone, :currently, :hourly, :daily

  def initialize(forecast_data, full_location)
    @id = nil
    @full_location = full_location
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
     location: location}
  end

  def forecast_currently_details
    {icon: @currently[:icon],
     today: @today[:summary],
     tonight: @daily[0][:summary],
     feels_like: @currently[:apparentTemperature],
     humidity: @currently[:humidity],
     visibility: @currently[:visibility],
     uv_index: @currently[:uvIndex]}
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

  def location
    {city: @full_location.city,
     state: @full_location.state,
     country: @full_location.country}
  end
end
