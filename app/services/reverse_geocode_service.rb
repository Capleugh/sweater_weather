class ReverseGeocodeService
  def get_antipode_json(antipode)
    antipode_city_data = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json") do |req|
      req.params['key'] = ENV['GOOGLE_API_KEY']
      req.params['latlng'] = "#{antipode.lat},#{antipode.lng}"
    end
    JSON.parse(antipode_city_data.body, symbolize_names: true)
  end
end
