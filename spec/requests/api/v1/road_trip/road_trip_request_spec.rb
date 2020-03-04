require 'rails_helper'

RSpec.describe 'road trip api', :vcr do
  it 'sends information about' do
    allow(Time).to receive(:now).and_return(Time.parse('2020-03-02 11:22:54 -0700'))

    user = User.create(email: "whatever@example.com", password: "password")

    road_trip_params = {
      origin: "Denver, CO",
      destination: "Pueblo, CO",
      api_key: user.api_key
    }

    post '/api/v1/road_trip', params: road_trip_params

    road_trip_json = JSON.parse(response.body)
  end
end
