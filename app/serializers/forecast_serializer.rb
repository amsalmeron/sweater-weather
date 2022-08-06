class ForecastSerializer
    include JSONAPI::Serializer
    def self.full_forecast(forecast)
        {
            data: {
                id: nil,
                type: "forecast",
                attributes: {
                    current_weather: {
                        datetime: forecast[:current][:dt],
                        sunrise: forecast[:current][:sunrise],
                        sunset: forecast[:current][:sunset],
                        temperature: forecast[:current][:temp],
                        feels_like: forecast[:current][:feels_like],
                        humidity: forecast[:current][:humidity],
                        uvi: forecast[:current][:uvi],
                        visibility: forecast[:current][:visibility],
                        conditions: forecast[:current][:weather][0][:description],
                        icon: forecast[:current][:weather][0][:icon]
                    },
                    daily_weather: forecast[:daily].map do |daily_forecast| {
                        date: daily_forecast[:dt],
                        sunrise: daily_forecast[:sunrise],
                        sunset: daily_forecast[:sunset],
                        max_temp: daily_forecast[:temp][:max],
                        min_temp: daily_forecast[:temp][:min],
                        conditions: daily_forecast[:weather][0][:description],
                        icon: daily_forecast[:weather][0][:icon]
                    }
                    end,
                    hourly_weather: forecast[:hourly].map do |hourly_forecast| {
                        time: hourly_forecast[:dt],
                        temperature: hourly_forecast[:temp],
                        conditions: hourly_forecast[:weather][0][:description],
                        icon: hourly_forecast[:weather][0][:icon]
                    }
                    end
                }
            }
        }
    end
end