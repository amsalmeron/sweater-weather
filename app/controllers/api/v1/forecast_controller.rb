class Api::V1::ForecastController < ApplicationController 
    def index
        forecast = ForecastFacade.find_forecast(params[:location])
        render json: ForecastSerializer.full_forecast(forecast)
    end
end