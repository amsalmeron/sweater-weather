require 'rails_helper'

RSpec.describe MunchieService do
  describe 'methods' do
    it 'returns the first restaurant for given location and cuisine' do
      restaurant = MunchieService.get_restaurant_destination("denver,co","chinese")
      
      expect(restaurant[:businesses][0]).to have_key(:name)
      expect(restaurant[:businesses][0]).to have_key(:categories)
      expect(restaurant[:businesses][0]).to have_key(:location)
      expect(restaurant[:businesses][0]).to have_key(:coordinates)
    end
  end
end