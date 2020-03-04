class RoadTripFacade
  attr_reader :id

  def initialize(origin, destination, api_key)
    @id = nil
    @origin = origin
    @destination = destination
    @api_key = api_key
  end
end
