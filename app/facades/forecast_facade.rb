class ForecastFacade
  def initialize(location)
    @location = location
  end

  def get_location
    Location.new(get_location_data)
  end

  def get_forecast
    Forecast.new(get_weather_data, get_location)
  end

  def get_location_data
    service = GeocodeService.new
    service.get_location_json(@location)
  end

  def get_weather_data
    service = DarkSkyService.new
    service.get_forecast_json(get_location)
  end
end
