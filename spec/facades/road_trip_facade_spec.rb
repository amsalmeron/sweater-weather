require 'rails_helper'

RSpec.describe RoadTripFacade do
  describe 'methods' do
    it 'returns a road trip' do
      origin = 'Denver, CO'
      destination = 'Pueblo, CO'
      road_trip = RoadTripFacade.trip_directions(origin, destination)

      expect(road_trip).to be_a(RoadTrip)
    end
  end
end