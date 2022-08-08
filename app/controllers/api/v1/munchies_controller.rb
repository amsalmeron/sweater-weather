class Api::V1::MunchiesController < ApplicationController 
    def index
        restaurant = MunchieFacade.restaurant_destination(params[:location], params[:food])
        forecast = ForecastFacade.find_forecast(params[:location])

        if !restaurant.nil?
            render json: MunchieSerializer.munchie_data(restaurant, forecast) 
        else
            render json: {data: { message: "Invalid Input" } }, status: 400
        end
    end
end