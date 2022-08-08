require 'rails_helper'

RSpec.describe "Muchie API" do
    it "returns a restuarnt and forecast for select cuisine and city" do
        get "/api/v1/munchies?location=denver,co&food=chinese"

        expect(response).to be_successful
        expect(response).to have_http_status(200)
        
        response_body = JSON.parse(response.body, symbolize_names: true)

        restaurant = response_body[:data]

        expect(restaurant[:id]).to  eq(nil)
        expect(restaurant[:type]).to  eq('munchie')

        expect(restaurant[:attribtues][:destination_city]).to  eq('Denver, CO')

        expect(restaurant[:attribtues]).to  have_key(:forecast)
        expect(restaurant[:attribtues][:forecast]).to  have_key(:summary)
        expect(restaurant[:attribtues][:forecast]).to  have_key(:temperature)

        expect(restaurant[:attribtues]).to  have_key(:restaurant)
        expect(restaurant[:attribtues][:restaurant]).to  have_key(:name)
        expect(restaurant[:attribtues][:restaurant]).to  have_key(:address)
    end
end
