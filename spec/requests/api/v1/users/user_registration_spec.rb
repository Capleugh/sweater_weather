require 'rails_helper'

RSpec.describe 'user registration api' do
  it 'sends user information which is required in order to make an account succesfully' do

    body = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }

    post '/api/v1/users'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json["api_key"]).to 
  end

  xit "sends error messages describing why request wasn't handled successfully" do

    expect(response).to be_404
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
