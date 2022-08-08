require 'rails_helper'

RSpec.describe "Muchie API" do
    describe "happy path" do
        it "returns a restuarnt and forecast for select cuisine and city" do
            get "/api/v1/munchies?location=denver,co&food=chinese"
    
            expect(response).to be_successful
            expect(response).to have_http_status(200)
            
            response_body = JSON.parse(response.body, symbolize_names: true)
    
            restaurant = response_body[:data]
    
            expect(restaurant[:id]).to  eq("null")
            expect(restaurant[:type]).to  eq('munchie')
    
            expect(restaurant[:attributes][:destination_city]).to  eq('Denver, CO')
    
            expect(restaurant[:attributes]).to  have_key(:forecast)
            expect(restaurant[:attributes][:forecast]).to  have_key(:summary)
            expect(restaurant[:attributes][:forecast]).to  have_key(:temperature)
    
            expect(restaurant[:attributes]).to  have_key(:restaurant)
            expect(restaurant[:attributes][:restaurant]).to  have_key(:name)
            expect(restaurant[:attributes][:restaurant]).to  have_key(:address)
        end
    end
    
    describe "sad path" do
        it "returns a restuarnt and forecast for select cuisine and city" do
            get "/api/v1/munchies?location=123&food=chinese"
            response_data = JSON.parse(response.body, symbolize_names: true)

            expect(response).to have_http_status(400)
            expect(response_data[:data]).to have_key(:message)
            expect(response_data[:data][:message]).to eq("Invalid Input")
        end
    end
    
end
