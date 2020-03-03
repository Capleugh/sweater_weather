class UnsplashService
  def get_background_json(location)
    background_data = Faraday.get("https://api.unsplash.com/search/photos") do |req|
      req.params['query'] = location
      req.params['client_id'] = ENV['UNSPLASH_API_KEY']
    end

    JSON.parse(background_data.body, symbolize_names: true)
  end
end
