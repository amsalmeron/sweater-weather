class Api::V1::MunchiesController < ApplicationController 
    def index
        forecast = ForecastFacade.find_forecast(params[:location])
        munchie = MunchieFacade.restaurant_destination(params[:location], params[:food])
        
        if !munchie.nil?
            render json: MunchieSerializer.munchie_data(munchie) 
        else
            render json: {data: { message: "Invalid Input" } }, status: 400
        end
    end
end