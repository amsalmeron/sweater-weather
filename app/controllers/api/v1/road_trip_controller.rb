class Api::V1::RoadTripController < ApplicationController 
    before_action :validate_api_key

    def create
        road_trip = RoadTripFacade.trip_directions(params[:origin], params[:destination]) 

        if road_trip.class == RoadTrip
            render json: RoadTripSerializer.trip_data(road_trip)
        else
            invalid_route 
        end
    end

    private

    def invalid_credentials
        render json: { data: { message: 'Invalid Login' }}
    end 

    def invalid_route
        render json: { data: { message: 'Unable to route with the given locations.' }}
    end 

    def validate_api_key
        user = User.find_by(auth_token: params[:api_key])
        return invalid_credentials if user.nil?
    end
    
end