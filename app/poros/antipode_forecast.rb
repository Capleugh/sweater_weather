class AntipodeForecast
  attr_reader :summary, :current_temperature

  def initialize(forecast_data)
    @summary = forecast_data[:currently][:summary]
    @current_temperature = forecast_data[:currently][:temperature]
  end
end
