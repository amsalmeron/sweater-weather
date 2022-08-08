class BaseService
    def self.mapquest_connection
        Faraday.new("http://www.mapquestapi.com")
    end

    def self.openweather_connection
        Faraday.new("http://api.openweathermap.org")
    end

    def self.yelp_connection
        Faraday.new("https://api.yelp.com")
    end
    
end