class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      response.status = 200

      render json: UserSerializer.new(user)
    else
      response.status = 401

      render json: { login_error: "Your credentials are bad. Please try again." }
    end
  end
end
