require 'rails_helper'

RSpec.describe 'user registration api', :vcr do
  it 'creates a user and api key' do
    user_params = {
      email: "whatever@example.com",
      password: "password",
      password_confirmation: "password"
    }

    post '/api/v1/users', params: user_params

    user = User.last

    expect(response).to be_successful
    user_json = JSON.parse(response.body)

    expect(user.email).to eq("whatever@example.com")
    expect(response).to have_http_status(:created)
    expect(user_json["data"]["attributes"]).to have_key("api_key")
  end

  it "sends a blank email error message" do
    user_params = {
      email: "",
      password: "password",
      password_confirmation: "password"
    }

    post '/api/v1/users', params: user_params

    expect(response).to_not be_successful
    expect(response).to have_http_status(:unauthorized)
  end

  it "sends a blank password error message" do
    user_params = {
      email: "whatever@example.com",
      password: "",
      password_confirmation: ""
    }

    post '/api/v1/users', params: user_params

    expect(response).to_not be_successful
    expect(response).to have_http_status(:unauthorized)
  end

  it "sends a passwords don't match error message" do
    user_params = {
      email: "whatever@example.com",
      password: "password",
      password_confirmation: "word"
    }

    post '/api/v1/users', params: user_params

    expect(response).to_not be_successful
    expect(response).to have_http_status(:unauthorized)
    expect(response.body).to eq("{\"registration_failed\":\"Password confirmation doesn't match Password\"}")
  end

  it "sends a email already in use error message" do
    User.create(email: "whatever@example.com", password: "password", password_confirmation: "password")

    user_params = {
      email: "whatever@example.com",
      password: "password",
      password_confirmation: "password"
    }

    post '/api/v1/users', params: user_params

    expect(response).to_not be_successful
    expect(response).to have_http_status(:unauthorized)
  end
end
