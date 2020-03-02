class ForecastSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :location, :timezone #:currently, :hourly, :daily maybe you want those here? maybe not?

  attribute :forecast_currently do |location|
    location.forecast_currently
  end

  attribute :forecast_currently_details do |location|
    location.forecast_currently_details
  end

  attribute :forecast_hourly do |location|
    location.forecast_hourly
  end

  attribute :forecast_daily do |location|
    location.forecast_daily
  end
end
