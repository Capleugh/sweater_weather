class MunchiesFacade
  def initialize(origin, destination, food)
    # require "pry"; binding.pry
    @origin = origin
    @destination = destination
    @food = food
  end

  def get_destination
    Destination.new(get_directions_data)
  end

  # def get_future_forecast
  #   Forecst.new()
  # end

  def get_directions_data
    service = GeocodeService.new
    service.get_directions_json(@origin, @destination)
  end

  def get_future_forecast_data
    service = DarkSkyService.new
    service.get_future_forecast_json(get_destination)
  end
end
