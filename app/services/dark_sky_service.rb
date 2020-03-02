class DarkSkyService
  def get_forecast_json(location)
    weather_data = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API_KEY']}/#{location.lat},#{location.lng}")

    json = JSON.parse(weather_data.body, symbolize_names: true)
    # require "pry"; binding.pry
  end
end
