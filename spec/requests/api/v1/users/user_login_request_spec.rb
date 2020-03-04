require 'rails_helper'

RSpec.describe 'user login api', :vcr do
  it 'logs in a user and returns api key' do
    user = User.create(email: "whatever@example.com", password: "password")

    user_params = {
      email: "whatever@example.com",
      password: "password"
    }

    post '/api/v1/sessions', params: user_params

    expect(response).to be_successful
    user_json = JSON.parse(response.body)

    expect(response).to have_http_status(:ok)
    expect(user.email).to eq("whatever@example.com")
    expect(user_json["data"]["attributes"]["api_key"]).to eq(user.api_key)
  end

  it "sends vague error message for any bad combination" do
    User.create(email: "whatever@example.com", password: "password")

    user_params = {
      email: "",
      password: "password"
    }

    post '/api/v1/users', params: user_params

    expect(response).to_not be_successful
    expect(response).to have_http_status(:unauthorized)
  end

  it "sends vague error message for any bad combination" do
    User.create(email: "whatever@example.com", password: "password")

    user_params = {
      email: "whatever@example.com",
      password: "word"

    }

    post '/api/v1/users', params: user_params

    expect(response).to_not be_successful
    expect(response).to have_http_status(:unauthorized)
  end

  it "sends vague error message for any bad combination" do
    User.create(email: "whatever@example.com", password: "password")

    user_params = {
      email: "whatever@example.com",
      password: ""

    }

    post '/api/v1/users', params: user_params

    expect(response).to_not be_successful
    expect(response).to have_http_status(:unauthorized)
  end
end
