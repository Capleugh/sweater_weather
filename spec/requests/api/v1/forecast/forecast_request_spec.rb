require 'rails_helper'

RSpec.describe "forecast api", :vcr do
  it "sends information about the forecast for a specific location" do
    # allow(Time).to receive(:now).and_return(Time.parse('2020-03-02 11:22:54 -0700'))


    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:type]).to eq("forecast")
    expect(json[:data][:attributes][:timezone]).to eq("America/Denver")

    expect(json[:data][:attributes][:location][:city]).to eq("Denver")
    expect(json[:data][:attributes][:location][:state]).to eq("CO")
    expect(json[:data][:attributes][:location][:country]).to eq("United States")

    expect(json[:data][:attributes][:forecast_currently][:summary]).to eq("Clear")
    expect(json[:data][:attributes][:forecast_currently][:icon]).to eq("clear-night")
    expect(json[:data][:attributes][:forecast_currently][:time]).to eq(1583218712)
    # expect(json[:data][:attributes][:forecast_currently][:temp]).to eq(27.26)
    # expect(json[:data][:attributes][:forecast_currently][:high]).to eq(42.59)
    # expect(json[:data][:attributes][:forecast_currently][:low]).to eq(23.44)
    # expect(json[:data][:attributes][:forecast_currently][:location][:city]).to eq("Denver")
    # expect(json[:data][:attributes][:forecast_currently][:location][:state]).to eq("CO")
    # expect(json[:data][:attributes][:forecast_currently][:location][:country]).to eq("United States")
    #
    # expect(json[:data][:attributes][:forecast_daily][0]).to eq({:time=>1583046000, :icon=>"snow", :precip_chance=>0.57, :high=>42.59, :low=>23.44})
    # expect(json[:data][:attributes][:forecast_daily][1]).to eq({:time=>1583132400, :icon=>"clear-day", :precip_chance=>0.29, :high=>47.79, :low=>26.05})
    # expect(json[:data][:attributes][:forecast_daily][2]).to eq({:time=>1583218800, :icon=>"clear-day", :precip_chance=>0.04, :high=>54.92, :low=>27.22})
    # expect(json[:data][:attributes][:forecast_daily][3]).to eq({:time=>1583305200, :icon=>"clear-day", :precip_chance=>0.02, :high=>60.22, :low=>35.45})
    # expect(json[:data][:attributes][:forecast_daily][4]).to eq({:time=>1583391600, :icon=>"clear-day", :precip_chance=>0.02, :high=>60.41, :low=>30.97})
    #
    # expect(json[:data][:attributes][:forecast_hourly]).to eq(
    #   [
    #     {:time=>1583128800, :icon=>"partly-cloudy-night", :temp=>28.33},
    #     {:time=>1583132400, :icon=>"snow", :temp=>27.09},
    #     {:time=>1583136000, :icon=>"snow", :temp=>27.15},
    #     {:time=>1583139600, :icon=>"partly-cloudy-night", :temp=>27.27},
    #     {:time=>1583143200, :icon=>"partly-cloudy-night", :temp=>26.33},
    #     {:time=>1583146800, :icon=>"cloudy", :temp=>25.31},
    #     {:time=>1583150400, :icon=>"partly-cloudy-night", :temp=>24.32},
    #     {:time=>1583154000, :icon=>"partly-cloudy-night", :temp=>23.94}
    #   ]
    # )
  end

  # IS THIS WORTH TESTING WITH VCR IF I HAVE TO RENEW IT REGULARLY?
  # STUB OUT TIME?
end
