 class Api::V1::AntipodeController < ApplicationController
   def show
     antipode = AntipodeFacade.new(location_params)
     antipode.get_forecast
   end

   private

   def location_params
     params.permit(:location)
   end
 end
