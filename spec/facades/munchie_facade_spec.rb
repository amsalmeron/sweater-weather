require 'rails_helper'

RSpec.describe MunchieFacade do
    describe "methods" do
        it 'returns a restaurant PORO' do
            restaurant = MunchieFacade.restaurant_destination("denver,co","chinese")

            expect(restaurant).to have_key(:name)
            expect(restaurant).to have_key(:categories)
            expect(restaurant).to have_key(:location)
        end
    end
end