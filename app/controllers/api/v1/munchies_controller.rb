class Api::V1::MunchiesController < ApplicationController
  def show
    start = params[:start]
    destination = params[:end]
    food = params[:food]

    munchies = MunchiesFacade.new(start, destination, food)
    munchies.get_all_info

    render json: MunchiesSerializer.new(munchies)
  end
end
