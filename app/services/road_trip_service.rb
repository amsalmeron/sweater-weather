class RoadTripService < BaseService 
    def self.get_trip_directions(origin, destination)
        response = mapquest_connection.get("/directions/v2/route") do |faraday|
            faraday.params['key'] = ENV['mapquest_api_key']
            faraday.params['from'] = origin
            faraday.params['to'] = destination
        end

        JSON.parse(response.body, symbolize_names: true)
    end
    
end