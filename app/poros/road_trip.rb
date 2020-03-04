class RoadTrip
  attr_reader :id, :origin, :destination

  def initialize(origin, destination, travel_time, forecast)
    @id = nil
    @origin = origin
    @destination = destination
    @travel_time = travel_time
    @forecast = forecast
  end

  def travel_time
    @travel_time.duration
  end

  def forecast
    {summary: @forecast.summary,
     temp: @forecast.temp}
  end
end
