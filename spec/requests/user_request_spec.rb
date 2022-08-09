require 'rails_helper'

RSpec.describe "User Request" do
    describe "happy path" do
        it "can create a new user with JSON payload in body of request" do
            data = {
                "email": "antonio1@gmail.com",
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
    
    describe "sad path" do
        it "returns an error when user email exists" do
            data = {
                "email": "antonio@gmail.com",
                "password": "password123",
                "password_confirmation": "password123"
            }
            headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
            post '/api/v1/users', headers: headers, params: JSON.generate(data)
            
            expect(response).to have_http_status(409)
            error = JSON.parse(response.body, symbolize_names: true)
            expect(error[:data]).to have_key(:message)
            expect(error[:data][:message]).to eq('Invalid Email or Password')
        end

        it "returns error when password do not match" do
            data = {
                "email": "antonio1@gmail.com",
                "password": "password123",
                "password_confirmation": "password"
            }
            headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
            post '/api/v1/users', headers: headers, params: JSON.generate(data)
            
            expect(response).to have_http_status(400)
            error = JSON.parse(response.body, symbolize_names: true)
            
            expect(error[:data][:message]).to eq('Passwords do not match')
        end
    end
end