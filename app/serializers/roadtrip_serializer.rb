class RoadtripSerializer
  include FastJsonapi::ObjectSerializer

  attributes :origin, :destination, :travel_time, :forecast
end
