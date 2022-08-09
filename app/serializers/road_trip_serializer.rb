class RoadTripSerializer
    include JSONAPI::Serializer
    def self.trip_data(trip)
        { 
            data: {
                id: "null",
                type: "roadtrip",
                attributes: {
                    start_city: trip.start_city,
                    end_city: trip.end_city,
                    travel_time: trip.travel_time,
                    weather_at_eta: {
                        temperature: trip.temperature,
                        conditions: trip.conditions
                    }
                }
            }
        }
    end
end