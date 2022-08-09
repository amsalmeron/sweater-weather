require 'rails_helper'

RSpec.describe 'User starts a session' do
    describe "happy path" do
        it "allows user to login and start a session" do
            User.create!(email: "antonio1@gmail.com", password: "password123")
            data = {
                "email": "antonio1@gmail.com",
                "password": "password123",
                }
            headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
            post '/api/v1/sessions', headers: headers, params: JSON.generate(data)
            
            expect(response).to be_successful
            expect(response).to have_http_status(200)
    
            user = JSON.parse(response.body, symbolize_names: true)
    
                
            expect(user).to have_key(:data)
            expect(user[:data]).to have_key(:type)
            expect(user[:data]).to have_key(:id)
            expect(user[:data]).to have_key(:attributes)
            expect(user[:data][:attributes]).to have_key(:email)
            expect(user[:data][:attributes]).to have_key(:api_key)
    
            expect(user[:data][:type]).to eq("users")
            expect(user[:data][:attributes][:email]).to eq("antonio1@gmail.com")
        end
    end
    
    describe "sad path" do
        it "allows user to login and start a session" do
            User.create!(email: "antonio1@gmail.com", password: "password123")
            data = {
                "email": "fake@gmail.com",
                "password": "password123",
                }
            headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
            post '/api/v1/sessions', headers: headers, params: JSON.generate(data)
            
            expect(response).to have_http_status(401)
    
            error = JSON.parse(response.body, symbolize_names: true)
            expect(error[:data]).to have_key(:message)
            expect(error[:data][:message]).to eq('Invalid Email or Password')
        end
    end
end