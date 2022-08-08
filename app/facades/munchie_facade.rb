class MunchieFacade
    def self.restaurant_destination(location, cuisine)
        json = MunchieService.get_restaurant_destination(location, cuisine)
        restaurant = json[:businesses].first
    end
end