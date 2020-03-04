class Api::V1::UsersController < ApplicationController
  def create
    user = User.create!(user_params)
    if user.save
      response.status = 200
      # render json in here
    else
      response.status = 401
      # require "pry"; binding.pry
      # render some json in here
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
