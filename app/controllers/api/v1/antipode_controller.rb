 class Api::V1::AntipodeController < ApplicationController
   def show
     antipode = AntipodeFacade.new(location_params)
     antipode.get_antipode_location_data
   end

   private

   def location_params
     params.permit(:location)
   end
 end
