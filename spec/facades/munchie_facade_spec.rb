require 'rails_helper'

RSpec.describe MunchieFacade do
    describe "methods" do
        it 'returns a restaurant PORO' do
            restaurant = MunchieFacade.restaurant_destination("denver,co","chinese")

            expect(restaurant).to be_a(Restaurant)
        end
    end
end