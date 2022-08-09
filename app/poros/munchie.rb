class Munchie
    attr_reader :name, :city, :address, :forecast_summary, :forecast_temp

    def initialize(restaurant_data, forecast_data)
      @name = restaurant_data[:name]
      @city = restaurant_data[:location][:city] + ", " + restaurant_data[:location][:state]
      @address = restaurant_data[:location][:address1] + ", " + restaurant_data[:location][:city] + ", " + restaurant_data[:location][:state] + " " + restaurant_data[:location][:zip_code]
      @forecast_summary = forecast_data[:current][:weather][0][:description]
      @forecast_temp = forecast_data[:current][:temp].to_s
    end
end