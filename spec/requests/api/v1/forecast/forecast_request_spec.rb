require 'rails_helper'

RSpec.describe "forecast api", :vcr do
  xit "sends information about the forecast for a specific location" do
    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful
# require "pry"; binding.pry
    json = JSON.parse(response.body, symbolize_names: true)
  end
end
