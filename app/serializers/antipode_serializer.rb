class AntipodeSerializer
  include FastJsonapi::ObjectSerializer

  attribute :location_name do |obj|
    obj.get_antipode_city.city
  end

  attribute :forecast do |obj|
    obj.get_forecast.forecast
  end

  attribute :search_location do |obj|
    obj.search_location.city
  end
end
