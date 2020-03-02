class GeocodeService
  def get_coordinate_json(location)
    coordinate_data = Faraday.get('https://maps.googleapis.com/maps/api/geocode/json') do |req|
      req.params['address'] = location
      req.params['key'] = ENV['GOOGLE_API_KEY']
    end
    JSON.parse(coordinate_data.body, symbolize_names: true)
  end
end