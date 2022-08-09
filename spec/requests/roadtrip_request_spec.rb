require 'rails_helper'

RSpec.describe 'Create a Road Trip' do
    it "allows user to login and start a session" do
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

            
    end
    
end