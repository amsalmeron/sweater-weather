require 'rails_helper'

RSpec.describe RoadTripService do
  describe 'methods' do
    it 'returns the road trip details', :vcr do
      origin = 'Denver, CO'
      destination = 'Pueblo, CO'
      road_trip = RoadTripService.get_trip_directions(origin, destination)
        
      expect(road_trip[:route]).to have_key(:formattedTime)
      expect(road_trip[:route][:formattedTime]).to be_a(String)
      expect(road_trip[:route]).to have_key(:realTime)
      expect(road_trip[:route][:realTime]).to be_a(Integer)
      expect(road_trip[:route]).to have_key(:legs)
    end
  end
end
