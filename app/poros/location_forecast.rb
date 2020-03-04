class LocationForecast
  attr_reader :id, :timezone

  def initialize(location, forecast)
    @id = nil
    @city = location.city
    @state = location.state
    @country = location.country
    @timezone = forecast.timezone
    @today = forecast.today
    @currently = forecast.currently
    @hourly = forecast.hourly
    @daily = forecast.daily
  end

  def location
    {city: @city,
     state: @state,
     country: @country}
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
end
