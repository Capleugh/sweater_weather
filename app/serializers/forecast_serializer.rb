class ForecastSerializer
  include FastJsonapi::ObjectSerializer

  attributes :timezone, :location, :forecast_currently, :forecast_currently_details, :forecast_hourly, :forecast_daily
end
