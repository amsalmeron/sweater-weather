require 'rails_helper'

RSpec.describe MunchieFacade do
    describe "methods" do
        it 'returns a restaurant PORO' do
            munchie = MunchieFacade.restaurant_destination("denver,co","chinese")

            expect(munchie.name).to be_a(String)
            expect(munchie.city).to be_a(String)
            expect(munchie.address).to be_a(String)
            expect(munchie.forecast_summary).to be_a(String)
            expect(munchie.forecast_temp).to be_a(String)
        end
    end
end