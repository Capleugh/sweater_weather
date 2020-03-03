class Antipode
  attr_reader :lat, :lng

  def initialize(antipode_data)
    @lat = antipode_data[:data][:attributes][:lat]
    @lng = antipode_data[:data][:attributes][:long]
  end
end
