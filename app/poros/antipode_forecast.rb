class AntipodeForecast
  def initialize(forecast_data)
    @summary = forecast_data[:currently][:summary]
    @current_temperature = forecast_data[:currently][:temperature]
  end

  def forecast
    {
      summary: @summary,
      current_temperature: @current_temperature.round.to_s
    }
  end
end
