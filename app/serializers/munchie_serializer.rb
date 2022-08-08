class MunchieSerializer
    include JSONAPI::Serializer
    def self.munchie_data(restaurant_data, forecast_data)
        { 
            data: {
                id: "null",
                type: "munchie",
                attributes: {
                    destination_city: restaurant_data[:location][:city] + ", " + restaurant_data[:location][:state],
                    forecast: {
                        summary: forecast_data[:current][:weather][0][:description],
                        temperature: forecast_data[:current][:temp]
                    },
                    restaurant: {
                        name: restaurant_data[:name],
                        address: restaurant_data[:location][:address1] + ", " + restaurant_data[:location][:city] + ", " + restaurant_data[:location][:state] + " " + restaurant_data[:location][:zip_code]
                    }
                }
            }
        }
    end
end