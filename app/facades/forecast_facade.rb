class ForecastFacade

    def self.find_forecast(location)
        # forecast = {}
        # forecast[:current_forecast] = current_forecast(location)
        # forecast[:hourly_forecast] = hourly_forecast(location)
        # forecast[:daily_forecast] = daily_forecast(location)
        ForecastService.get_find_forecast(find_coordinates(location))
    end
    
    def self.current_forecast(location)
    end
    # def self.find_coordinates(location)
    #     coordinates = ForecastService.get_find_forecast(find_coordinates(location))
    # end
    # def self.find_coordinates(location)
    #     coordinates = ForecastService.get_find_forecast(find_coordinates(location))
    # end
    def self.find_coordinates(location)
        location_data = ForecastService.get_find_coordinates(location)
        coordinates = location_data[:results][0][:locations][0][:latLng]
    end
end