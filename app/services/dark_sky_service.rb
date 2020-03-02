class DarkSkyService
  def get_forecast_json(location)
    weather_data = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API_KEY']}/#{location.lat},#{location.lng}")

    JSON.parse(weather_data.body, symbolize_names: true)
  end

  def get_future_forecast_json(destination)
    forecast_data = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API_KEY']}/#{destination.lat},#{destination.lng},#{destination.time}")

    json = JSON.parse(forecast_data.body, symbolize_names: true)
    # requi"pry"; binding.pry
  end
end
