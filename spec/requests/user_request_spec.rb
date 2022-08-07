require 'rails_helper'

RSpec.describe "User Request" do
    it "can create a new user with JSON payload in body of request" do
        data = {
            "email": "antonio@gmail.com",
            "password": "password123",
            "password_confirmation": "password123"
            }
        headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
        post '/api/v1/users', headers: headers, params: JSON.generate(data)
        
        expect(response).to be_successful 
        expect(response).to have_http_status(201)
        
        user = JSON.parse(response.body, symbolize_names: true)
        expect(user[:data][:type]).to eq("users")
        expect(user[:data]).to have_key(:id)
        expect(user[:data]).to have_key(:attributes)
    end
    
end