class MunchiesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :end_location, :travel_time, :forecasts

  attribute :restaurant do |res|
    res.name
    res.address
  end
end
