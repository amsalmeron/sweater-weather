class ForecastFacade

    def self.find_forecast(location)
        ForecastService.get_find_forecast(find_coordinates(location))
    end
    
    def self.find_coordinates(location)
        location_data = ForecastService.get_find_coordinates(location)
        coordinates = location_data[:results][0][:locations][0][:latLng]
    end
end