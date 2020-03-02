class YelpService
  def get_restaurant_json(category, destination)
    restaurant_data = Faraday.get("https://api.yelp.com/v3/businesses/search") do |req|
      req.headers['Authorization'] = ENV['YELP_API_KEY']
      req.params['terms'] = "food"
      req.params['categories'] = category
      req.params['open_at'] = destination.time
      req.params['latitude'] = destination.lat
      req.params['longitude'] = destination.lng
    end

    JSON.parse(restaurant_data.body, symbolize_names: true)
  end
end
