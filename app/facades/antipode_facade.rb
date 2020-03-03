class AntipodeFacade
  def initialize(location)
    # require "pry"; binding.pry
    @location = location
  end

  def get_location
    ForeignCountryLocation.new(get_location_data)
  end

  def get_location_data
    service = GeocodeService.new
    service.get_location_json(@location)
  end

  def get_antipode_data
    service = AmypodeService.new
    service.get_antipode_json(get_location)
  end
end
