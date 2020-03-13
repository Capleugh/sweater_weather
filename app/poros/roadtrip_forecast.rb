class RoadtripForecast
  attr_reader :summary, :temp

  def initialize(attributes)
    @summary = attributes.summary
    @temp = attributes.temp
  end
end
