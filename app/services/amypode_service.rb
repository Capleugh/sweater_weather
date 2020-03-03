class AmypodeService
  def get_antipode_coord_json(location)
    antipode_data = Faraday.get("http://amypode.herokuapp.com/api/v1/antipodes") do |req|
      req.headers['api_key'] = ENV['AMYPODE_API_KEY']
      req.params['lat'] = location.lat
      req.params['lng'] = location.lng
    end
    JSON.parse(antipode_data.body, symbolize_names: true)
  end
end

# antipode
# json[:data][:attributes][:lat] = -22.3193039
# json[:data][:attributes][:long] = 180.0
 #revers geocode https://maps.googleapis.com/maps/api/geocode/json?latlng=-22.3193039,180.0&key=YOUR_API_KEY
