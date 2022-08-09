class Forecast
    attr_reader :current_weather, :daily_weather, :hourly_weather

    def initialize(data)
      @current_weather = data[:current]
      @daily_weather = data[:daily]
      @hourly_weather = data[:hourly]
    end
end