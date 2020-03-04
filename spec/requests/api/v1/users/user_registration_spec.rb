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

    expect(user.email).to eq("whatever@example.com")
    expect(response).to have_http_status(:success)
    # expect(response).to have_http_status(:ok)
  end

  it "sends an error messages" do
    user_params = {
      email: "",
      password: "password",
      password_confirmation: "password"
    }

    post '/api/v1/users', params: user_params

    # expect(response).to 
    expect(response).to have_http_status(:error)
  end
end


#
# response
#
# status: 201
# body:
#
# {
#   "api_key": "jgn983hy48thw9begh98h4539h4",
# }

# A successful request creates a user and generates a unique api key associated with that user.
# An unsuccessful request returns a 400 level status code and body with a description of why the request wasn’t successful. Potential reasons a request would fail: passwords don’t match, email has already been taken, missing a field, etc.
