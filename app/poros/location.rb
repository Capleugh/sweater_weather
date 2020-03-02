class Location
  attr_reader :city, :state, :country, :lat, :lng

  def initialize(location_data)
    @city = location_data[:results][0][:address_components][0][:long_name]
    @state = location_data[:results][0][:address_components][2][:short_name]
    @country = location_data[:results][0][:address_components][3][:long_name]
    @lat = location_data[:results][0][:geometry][:location][:lat]
    @lng = location_data[:results][0][:geometry][:location][:lng]
  end
end
