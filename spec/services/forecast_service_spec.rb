require 'rails_helper'

RSpec.describe ForecastService do
  describe 'methods' do
    it 'returns the forecast for a given location' do
      coordinates = {lat: 39.738453, lng: -104.984853}
      forecast = ForecastService.get_find_forecast(coordinates)

      expect(forecast).to have_key(:current)
      expect(forecast).to have_key(:daily)
      expect(forecast).to have_key(:hourly)

      expect(forecast[:current]).to be_a(Hash)
      expect(forecast[:daily]).to be_a(Array)
      expect(forecast[:hourly]).to be_a(Array)
    end

    it "returns coordinates for a given location" do
        location = 'Denver, CO'
        denver_coordinates = {lat: 39.738453, lng: -104.984853}
        coordinates = ForecastService.get_find_coordinates(location)
        
        expect(coordinates[:results][0][:locations][0][:latLng]).to eq(denver_coordinates)
    end
  end
end
