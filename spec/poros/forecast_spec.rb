require 'rails_helper'

RSpec.describe Forecast do
  it 'can hold current weather, weekly daily weather and hourly weather' do
    data = {
      current: 'Todays weather data',
      daily: [{one: 'Day One Weather'},
              {two: 'Day Two Weather'},
              {three: 'Day Three Weather'}],
      hourly: [{one: 'Hour One Weather'},
               {two: 'Hour Two Weather'},
               {three: 'Hour Three Weather'}]
        }
      forecast = Forecast.new(data)

      expect(forecast).to be_a(Forecast)
      expect(forecast.current_weather).to eq('Todays weather data')
      expect(forecast.daily_weather[1][:two]).to eq('Day Two Weather')
      expect(forecast.hourly_weather[2][:three]).to eq('Hour Three Weather')
  end
end
