class BackgroundsFacade
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def get_background_image
    Image.new(get_background_image_data)
  end

  def get_background_image_data
    service = UnsplashService.new
    service.get_background_json(location)
  end
end
