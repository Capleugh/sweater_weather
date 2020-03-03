class AntipodeFacade
  def initialize(location)
    @location = location
  end

  def get_location
    ForeignCountryLocation.new(get_location_data)
  end

  def get_antipode
    Antipode.new(get_antipode_data)
  end

  def get_antipode_city
    AntipodeCity.new(get_antipode_location_data)
  end

  def get_forecast
    AntipodeForecast.new(get_forecast_data)
  end

  def get_forecast_data
    service = DarkSkyService.new
    service.get_forecast_json(get_antipode)
  end

  def get_antipode_location_data
    service = ReverseGeocodeService.new
    service.get_antipode_json(get_antipode)
  end

  def get_location_data
    service = GeocodeService.new
    service.get_location_json(@location)
  end

  def get_antipode_data
    service = AmypodeService.new
    service.get_antipode_coord_json(get_location)
  end
end
