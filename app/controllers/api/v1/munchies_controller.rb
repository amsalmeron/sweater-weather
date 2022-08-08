class Api::V1::MunchiesController < ApplicationController 
    def index
        restaurant = MunchieFacade.restaurant_destination(params[:location], params[:food])
        binding.pry
        
    end
end