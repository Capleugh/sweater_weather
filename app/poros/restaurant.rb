class Restaurant
  attr_reader :name, :address, :id
  def initialize(restaurant_data)
    @id = nil
    @name = restaurant_data[:businesses][0][:name]
    @address = restaurant_data[:businesses][0][:location][:display_address][0]
  end
end
