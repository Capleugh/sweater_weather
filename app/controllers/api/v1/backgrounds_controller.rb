class Api::V1::BackgroundsController < ApplicationController
  def show
    background = BackgroundsFacade.new(location_params)

    render json: BackgroundSerializer.new(background.get_background_image)
  end

  private

  def location_params
    params.permit(:location)
  end
end
