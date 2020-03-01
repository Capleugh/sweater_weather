require 'rails_helper'

RSpec.describe GeocodeService, :vcr do
  it "and returns that city's latitudinal and longitudinal coordinates" do
    geo_service = GeocodeService.new
    json = geo_service.get_coordinate_json('Denver, CO')

    expect(json[:results][0][:geometry][:location][:lat]).to eq(39.7392358)
    expect(json[:results][0][:geometry][:location][:lng]).to eq(-104.990251)
  end
end
