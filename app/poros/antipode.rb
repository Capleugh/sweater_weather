class Antipode
  attr_reader :id

  def initialize(location_name, forecast, search_location)
    @id = nil
    @location_name = location_name
    @forecast = forecast
    @search_location = search_location
  end

  def location_name
    @location_name.city
  end

  def forecast
    { summary: @forecast.summary,
      current_temperature: temperature}
  end

  def search_location
    @search_location.city
  end

  def temperature
    @forecast.current_temperature.round.to_s
  end
end
