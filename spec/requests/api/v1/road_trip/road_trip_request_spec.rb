require 'rails_helper'

RSpec.describe 'road trip api', :vcr do
  it "sends information about a user's road trip" do
    allow(Time).to receive(:now).and_return(Time.parse('2020-03-02 11:22:54 -0700'))

    user = User.create(email: "whatever@example.com", password: "password")

    user_params = {
      email: "whatever@example.com",
      password: "password"
    }

    post '/api/v1/sessions', params: user_params
    expect(response).to be_successful


    road_trip_params = {
      origin: "Denver, CO",
      destination: "Pueblo, CO",
      api_key: user.api_key
    }

    post '/api/v1/road_trip', params: road_trip_params

    expect(response).to be_successful

    road_trip_json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(:ok)

    attributes = road_trip_json[:data][:attributes]

    expect(attributes).to have_key(:origin)
    expect(attributes).to have_key(:destination)
    expect(attributes).to have_key(:travel_time)
    expect(attributes).to have_key(:forecast)
  end

  it "pemission denied if not a user" do
    allow(Time).to receive(:now).and_return(Time.parse('2020-03-02 11:22:54 -0700'))

    road_trip_params = {
      origin: "Denver, CO",
      destination: "Pueblo, CO"
    }

    post '/api/v1/road_trip', params: road_trip_params

    expect(response).to_not be_successful
    expect(response).to have_http_status(:unauthorized)
  end

  it "pemission denied if wrong api key" do
    allow(Time).to receive(:now).and_return(Time.parse('2020-03-02 11:22:54 -0700'))

    user_1 = User.create(email: "whatever@example.com", password: "password", api_key: "someNons3nse")

    user_params = {
      email: "whatever@example.com",
      password: "password"
    }

    post '/api/v1/sessions', params: user_params

    expect(response).to be_successful
    user_json = JSON.parse(response.body)

    expect(user_json["data"]["attributes"]["api_key"]).to eq(user_1.api_key)

    road_trip_params = {
      origin: "Denver, CO",
      destination: "Pueblo, CO",
      api_key: !user_1.api_key
    }

    post '/api/v1/road_trip', params: road_trip_params

    expect(response).to_not be_successful
    expect(response).to have_http_status(:unauthorized)
  end
end
