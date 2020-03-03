require 'rails_helper'

RSpec.describe "antipode api", :vcr do
  it "sends an antipode of city passed into query" do
    city = "hongkong"
    get "/api/v1/antipode?location=#{city}"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    # expect(json[:data][0][:attributes][:location_name]).to eq("some city in argentina")
    # expect(json[:data][0][:attributes][:forecast][:summary]).to eq("gross")
    # expect(json[:data][0][:attributes][:forecast][:current_temperature]).to eq("also gross")
    # expect(json[:data][0][:attributes][:search_location]).to eq("Hong Kong")
  end
end

# {
#     "data": [
#         {
#             "id": "1",
#             "type": "antipode",
#             "attributes": {
#                 "location_name": "Antipode City Name",
#                 "forecast": {
#                     "summary": "Mostly Cloudy,
#                     "current_temperature": "72",
#                                 },
#             "search_location": "Hong Kong"
#             }
#         }
#     ]
# }
