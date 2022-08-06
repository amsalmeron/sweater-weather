class ForecastService < BaseService
    def self.get_find_coordinates(location)
        response = mapquest_connection.get("/geocoding/v1/address") do |faraday|
            faraday.params['key'] = ENV['mapquest_api_key']
            faraday.params['location'] = location
        end
        JSON.parse(response.body, symbolize_names: true)
    end

    def self.get_find_forecast(coordinates)
        response = openweather_connection.get("/data/2.5/onecall") do |faraday|
            faraday.params['appid'] = ENV['openweather_api_key']
            faraday.params['lat'] = coordinates[:lat]
            faraday.params['lon'] = coordinates[:lng]
        end
        JSON.parse(response.body, symbolize_names: true)
    end
end