class MunchieFacade
    def self.restaurant_destination(location, cuisine)
        forecast_json = ForecastFacade.find_forecast(location)
        restaurant_json = MunchieService.get_restaurant_destination(location, cuisine)
        if !restaurant_json[:error]
            Munchie.new(restaurant_json[:businesses].first, forecast_json)
        end
    end
end