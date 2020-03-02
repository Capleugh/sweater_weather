class Destination
  attr_reader :time, :lat, :lng, :travel_time

  def initialize(directions_data)
    @time = directions_data[:routes][0][:legs][0][:duration][:value] + Time.now.to_i
    @lat =  directions_data[:routes][0][:legs][0][:end_location][:lat]
    @lng = directions_data[:routes][0][:legs][0][:end_location][:lng]
    @travel_time = directions_data[:routes][0][:legs][0][:duration][:text]
  end
end
