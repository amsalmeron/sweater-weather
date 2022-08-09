require 'rails_helper'

RSpec.describe ForecastFacade do
  describe 'methods' do
    it 'returns a forecast' do
      location = 'Denver, CO'
      forecast = ForecastFacade.find_forecast(location)

      expect(forecast).to be_a(Forecast)
    end
  end
end