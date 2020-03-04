require 'rails_helper'

RSpec.describe "forecast api", :vcr do
  it "sends information about the forecast for a specific location" do
    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    attributes = json[:data][:attributes]


    expect(attributes).to have_key(:timezone)
    expect(attributes).to have_key(:location)
    expect(attributes).to have_key(:forecast_currently)
    expect(attributes).to have_key(:forecast_hourly)
    expect(attributes).to have_key(:forecast_daily)
    expect(json[:data][:type]).to eq("forecast")
  end
end
