class MunchiesFacade
  attr_reader :id
  
  def initialize(id, origin, destination, food)
    @id = id
    @origin = origin
    @destination = destination
    @food = food
  end

  def get_all_info
    {forecast: get_future_forecast,
     restaurant: get_restaurant}
  end

  def get_destination
    Destination.new(get_directions_data)
  end

  def get_future_forecast
    FutureForecast.new(get_future_forecast_data, get_destination)
  end

  def get_restaurant
    Restaurant.new(get_restaurant_data)
  end

  def get_restaurant_data
    service = YelpService.new
    service.get_restaurant_json(@food, get_destination)
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
