class GeocodeService
  def get_location_json(location)
    coordinate_data = Faraday.get('https://maps.googleapis.com/maps/api/geocode/json') do |req|
      req.params['address'] = location
      req.params['key'] = ENV['GOOGLE_API_KEY']
    end
    JSON.parse(coordinate_data.body, symbolize_names: true)
  end

  def get_directions_json(origin, destination)
    location_data = Faraday.get('https://maps.googleapis.com/maps/api/directions/json') do |req|
      req.params['key'] = ENV['GOOGLE_API_KEY']
      req.params['origin'] = origin
      req.params['destination'] = destination
    end
    JSON.parse(location_data.body, symbolize_names: true)
    # require "pry"; binding.pry
  end
end
