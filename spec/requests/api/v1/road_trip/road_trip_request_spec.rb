require 'rails_helper'

RSpec.describe 'road trip api', :vcr do
  it 'sends information about' do
    user = User.create(email: "whatever@example.com", password: "password")

    road_trip_params = {
      origin: "Denver,CO",
      destination: "Pueblo, CO",
      api_key: user.api_key
    }

    post '/api/v1/road_trip', params: road_trip_params

    road_trip_json = JSON.parse(response.body)
  end
end
