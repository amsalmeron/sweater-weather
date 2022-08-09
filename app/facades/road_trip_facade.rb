class RoadTripFacade 
    def self.trip_directions(origin, destination)
        trip_json = RoadTripService.get_trip_directions(origin, destination)
        forecast_json = ForecastFacade.find_forecast(destination)
        
        if trip_json[:info][:statuscode] != 402
            RoadTrip.new(trip_json[:route], forecast_json)
        else
            trip_json[:info]
        end
    end
    
end