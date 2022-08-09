class ForecastSerializer
    include JSONAPI::Serializer
    def self.full_forecast(forecast)
        {
            data: {
                id: nil,
                type: "forecast",
                attributes: {
                    current_weather: {
                        datetime: forecast.current_weather[:dt],
                        sunrise: forecast.current_weather[:sunrise],
                        sunset: forecast.current_weather[:sunset],
                        temperature: forecast.current_weather[:temp],
                        feels_like: forecast.current_weather[:feels_like],
                        humidity: forecast.current_weather[:humidity],
                        uvi: forecast.current_weather[:uvi],
                        visibility: forecast.current_weather[:visibility],
                        conditions: forecast.current_weather[:weather][0][:description],
                        icon: forecast.current_weather[:weather][0][:icon]
                    },
                    daily_weather: forecast.daily_weather.map do |daily_forecast| {
                        date: daily_forecast[:dt],
                        sunrise: daily_forecast[:sunrise],
                        sunset: daily_forecast[:sunset],
                        max_temp: daily_forecast[:temp][:max],
                        min_temp: daily_forecast[:temp][:min],
                        conditions: daily_forecast[:weather][0][:description],
                        icon: daily_forecast[:weather][0][:icon]
                    }
                    end,
                    hourly_weather: forecast.hourly_weather.map do |hourly_forecast| {
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