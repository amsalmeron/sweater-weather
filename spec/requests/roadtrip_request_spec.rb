require 'rails_helper'

RSpec.describe 'Create a Road Trip' do
    describe "happy path" do
        it "allows user to login and start a session", :vcr do
            user = User.create!(email: "antonio1@gmail.com", password: "password123")
            data = {
                "origin": "Denver, CO",
                "destination": "Pueblo, CO",
                "api_key": "#{user.auth_token}",
                }
    
            headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
            post '/api/v1/road_trip', headers: headers, params: JSON.generate(data)
            
            expect(response).to be_successful
            expect(response).to have_http_status(200)
    
            road_trip = JSON.parse(response.body, symbolize_names: true)
            
            expect(road_trip[:data][:id]).to eq('null')
            expect(road_trip[:data][:type]).to eq('roadtrip')
            expect(road_trip[:data][:attributes]).to be_a(Hash)
            expect(road_trip[:data][:attributes][:start_city]).to eq('Denver, CO')
            expect(road_trip[:data][:attributes][:end_city]).to eq('Pueblo, CO')
            expect(road_trip[:data][:attributes][:travel_time]).to be_a(String)
            expect(road_trip[:data][:attributes][:weather_at_eta]).to be_a(Hash)
        end
    end
    
    describe "sad path" do
        it "user does not have an api key", :vcr do
            data = {
                "origin": "Denver, CO",
                "destination": "Pueblo, CO"
            }
            
            headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
            post '/api/v1/road_trip', headers: headers, params: JSON.generate(data)
            
            error = JSON.parse(response.body, symbolize_names: true)
            expect(error[:data][:message]).to eq('Invalid Login')    
        end    

        it "is impossible to drive", :vcr do
            user = User.create!(email: "antonio1@gmail.com", password: "password123")
            data = {
                "origin": "Denver, CO",
                "destination": "London",
                "api_key": "#{user.auth_token}",
            }
            
            headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
            post '/api/v1/road_trip', headers: headers, params: JSON.generate(data)

            error = JSON.parse(response.body, symbolize_names: true)
            expect(error[:data][:message]).to eq('Unable to route with the given locations.')    
        end      
    end
end