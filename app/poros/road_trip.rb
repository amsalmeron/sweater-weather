class RoadTrip 
    attr_reader :start_city, :end_city, :travel_time, :temperature, :conditions

    def initialize(route_data, forecast_data)
        @start_city = route_data[:locations][0][:adminArea5] + ", " + route_data[:locations][0][:adminArea3]
        @end_city = route_data[:locations][1][:adminArea5] + ", " + route_data[:locations][1][:adminArea3]
        @travel_time = calculate_time(route_data[:formattedTime])
        @conditions = arrival_forecast_conditions(forecast_data, route_data[:formattedTime])        
        @temperature = arrival_forecast_temp(forecast_data, route_data[:formattedTime]).to_s
    end
    
    def arrival_forecast_conditions(forecast_data, time)
        hours = time.slice(0..1).to_i
        minutes = time.slice(3..4).to_i
        hours += 1 if minutes >= 30
        
        if hours < 48
            forecast_data.hourly_weather[hours - 1][:weather][0][:description]
        elsif hours >= 48
            days = hours / 24
            forecast_data.daily_weather[days - 1][:weather][0][:description]
        else
            nil
        end
    end

    def arrival_forecast_temp(forecast_data, time)
        hours = time.slice(0..1).to_i
        minutes = time.slice(3..4).to_i
        hours += 1 if minutes >= 30
        if hours < 48
            forecast_data.hourly_weather[hours - 1][:temp]
        elsif hours >= 48
            days = hours / 24
            forecast_data.daily_weather[days - 1][:temp][:day]
        else
            nil
        end
    end

    def calculate_time(time)
        hours = time.slice(0..1)
        minutes = time.slice(3..4)
        "#{hours} hour(s), #{minutes} minutes"
    end
    
end