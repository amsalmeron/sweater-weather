require 'rails_helper'

RSpec.describe Munchie do
  it 'has a name, city, address, forecast summary and temp' do
    restaurant_data = {
        name: 'China Town',
        location: {
        city: 'Denver',
        state: 'CO',
        address1: '123 Park Ave',
        zip_code: '12345'
        }
    }
    forecast_data = {
        current: {
            weather: [{
                description: 'Sunny and Hot'  
                }],
            temp: '200'
        }
    }
    munchie = Munchie.new(restaurant_data, forecast_data)

    expect(munchie).to be_a(Munchie)
    expect(munchie.name).to eq("China Town")
    expect(munchie.city).to eq("Denver, CO")
    expect(munchie.address).to eq("123 Park Ave, Denver, CO 12345")
    expect(munchie.forecast_summary).to eq("Sunny and Hot")
    expect(munchie.forecast_temp).to eq("200")
  end
end