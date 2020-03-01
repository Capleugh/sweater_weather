class ForecastFacade
  def initialize(location_data)
    @lattitude = location_data[:lat]
    @longitude = location_data[:lng]
  end
end
