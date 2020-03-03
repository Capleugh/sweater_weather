class Image
  attr_reader :id, :image

  def initialize(image_data)
    @id = nil
    @image = image_data[:results][0][:urls][:raw]
  end
end
