require 'rails_helper'

RSpec.describe "backgrounds api", :vcr do
  it "sends url to background image for a specific locatiton" do
    get "/api/v1/backgrounds?location=denver,co"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
    
    expect(json[:data][:attributes][:image]).to eq("https://images.unsplash.com/photo-1519424187720-db6d0fc5a5d2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjExODU4NH0")
  end
end
