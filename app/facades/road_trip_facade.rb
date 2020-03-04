class RoadTripFacade
  attr_reader :id

  def initialize(road_trip_data)
    @id = nil
    @origin = road_trip_data[:origin]
    @destination = road_trip_data[:destination]
    @api_key = road_trip_data[:api_key]
  end

  def get_travel_time
    Destination.new(get_directions_data)
  end

  def get_forecast
    DestinationForecast.new(get_future_forecast_data)
  end

  def get_directions_data
    service = GeocodeService.new
    service.get_directions_json(@origin, @destination)
  end

  def get_future_forecast_data
    service = DarkSkyService.new
    service.get_future_forecast_json(get_destination)
  end
end
