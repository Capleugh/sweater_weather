require 'rails_helper'

RSpec.describe "forecast api", :vcr do
  it "sends information about the forecast for a specific location" do
    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:type]).to eq("forecast")
    expect(json[:data][:attributes][:location][:city]).to eq("Denver")
    expect(json[:data][:attributes][:location][:state]).to eq("CO")
    #come back and change Colorado to the abbreviation
    expect(json[:data][:attributes][:location][:country]).to eq("United States")
    expect(json[:data][:attributes][:timezone]).to eq("America/Denver")
    # come back and test this more robustly
  end
end
