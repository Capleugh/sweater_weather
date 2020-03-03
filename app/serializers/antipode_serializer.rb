class AntipodeSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :search_location

  attribute :location_name do |obj|
    obj.get_antipode_city.city
  end

  attribute :forecast do |obj|
    obj.get_forecast.forecast
  end

end
