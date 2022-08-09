class MunchieSerializer
    include JSONAPI::Serializer
    def self.munchie_data(munchie_data)
        { 
            data: {
                id: "null",
                type: "munchie",
                attributes: {
                    destination_city: munchie_data.city,
                    forecast: {
                        summary: munchie_data.forecast_summary,
                        temperature: munchie_data.forecast_temp
                    },
                    restaurant: {
                        name: munchie_data.name,
                        address: munchie_data.address
                    }
                }
            }
        }
    end
end