class ForeignCountryLocation
  attr_reader :city, :lat, :lng
  
  def initialize(location_data)
    @city = location_data[:results][0][:address_components][0][:long_name]
    @lat = location_data[:results][0][:geometry][:location][:lat]
    @lng = location_data[:results][0][:geometry][:location][:lng]
  end
end
