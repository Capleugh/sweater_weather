class DarkSkyService
  def get_forecast_json(location)
    weather_data = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API_KEY']}/#{location.lat},#{location.lng}")

    JSON.parse(weather_data.body, symbolize_names: true)
    # require "pry"; binding.pry
  end

  def get_future_forecast_json(destination)
    # require "pry"; binding.pry
    time = destination["routes"][0]["legs"][0]["duration"]["value"] + Time.now.to_i

    forecast_data = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API_KEY']}/#{destination.lat},#{destination.long},#{time}")

    json = JSON.parse(forecast_data.body, symbolize_names: true)
    # require "pry"; binding.pry
  end
end
