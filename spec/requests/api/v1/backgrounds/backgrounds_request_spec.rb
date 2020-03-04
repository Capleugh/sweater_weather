require 'rails_helper'

RSpec.describe "backgrounds api", :vcr do
  it "sends url to background image for a specific locatiton" do
    get "/api/v1/backgrounds?location=denver,co"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    attributes = json[:data][:attributes]

    expect(attributes).to have_key(:image)
  end
end
