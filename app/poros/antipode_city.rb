class AntipodeCity
  attr_reader :city

  def initialize(antipode_data)
    @city = antipode_data[:results][0][:address_components][2][:long_name]
  end
end
