require 'rails_helper'

RSpec.describe "background image api", :vcr do
  xit "sends information about an image for a specific location" do
    get "/api/v1/backgrounds?location=denver,co"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
  end
end
