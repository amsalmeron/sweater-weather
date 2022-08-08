class MunchieService < BaseService

    def self.get_restaurant_destination(location, cuisine)
        response = yelp_connection.get("/v3/businesses/search") do |faraday|
            faraday.headers['Authorization'] = ENV['yelp_api_key']
            faraday.params['location'] = location
            faraday.params['term'] = cuisine
        end
        JSON.parse(response.body, symbolize_names: true)
    end
end