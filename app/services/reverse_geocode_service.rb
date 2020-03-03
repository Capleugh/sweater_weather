class ReverseGeocodeService
  def get_antipode_json(antipode)
    antipode_city_data = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?#{}{antipode.lat},#{antipode.lng}") do |req|
      req.params['key'] = ENV['GOOGLE_API_KEY']
    end
    json = JSON.parse(antipode_city_data.body, symbolize_names: true)
    # require "pry"; binding.pry
  end
end
