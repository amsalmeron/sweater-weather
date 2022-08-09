class Api::V1::RoadTripController < ApplicationController 
    def create
        road_trip = RoadTripFacade.trip_directions(params[:origin], params[:destination])        
        
        render json: RoadTripSerializer.trip_data(road_trip)
    end
end