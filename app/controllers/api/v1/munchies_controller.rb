class Api::V1::MunchiesController < ApplicationController 
    def index
        restaurant = MunchieFacade.restaurant_destination(params[:location], params[:food])
        forecast = ForecastFacade.find_forecast(params[:location])
        
        render json: MunchieSerializer.munchie_data(restaurant, forecast)
        
    end
end