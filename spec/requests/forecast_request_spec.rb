require 'rails_helper'

RSpec.describe "Forcast API" do
    it "returns focast current, daily and hourly weather" do
        get "/api/v1/forecast?location=denver,co"

        expect(response).to be_successful
        expect(response).to have_http_status(200)
        
        response_body = JSON.parse(response.body, symbolize_names: true)

        forecast = response_body[:data]
        expect(forecast[:type]).to eq("forecast")
        expect(forecast[:attributes]).to have_key(:current_weather)
        expect(forecast[:attributes][:current_weather]).to have_key(:datetime)
        expect(forecast[:attributes][:current_weather]).to have_key(:sunrise)
        expect(forecast[:attributes][:current_weather]).to have_key(:sunset)
        expect(forecast[:attributes][:current_weather]).to have_key(:temperature)
        expect(forecast[:attributes][:current_weather]).to have_key(:feels_like)
        expect(forecast[:attributes][:current_weather]).to have_key(:humidity)
        expect(forecast[:attributes][:current_weather]).to have_key(:uvi)
        expect(forecast[:attributes][:current_weather]).to have_key(:visibility)
        expect(forecast[:attributes][:current_weather]).to have_key(:conditions)
        expect(forecast[:attributes][:current_weather]).to have_key(:icon)


        expect(forecast[:attributes]).to have_key(:daily_weather)
        expect(forecast[:attributes][:daily_weather][0]).to have_key(:date)
        expect(forecast[:attributes][:daily_weather][0]).to have_key(:sunrise)
        expect(forecast[:attributes][:daily_weather][0]).to have_key(:sunset)
        expect(forecast[:attributes][:daily_weather][0]).to have_key(:max_temp)
        expect(forecast[:attributes][:daily_weather][0]).to have_key(:min_temp)
        expect(forecast[:attributes][:daily_weather][0]).to have_key(:conditions)
        expect(forecast[:attributes][:daily_weather][0]).to have_key(:icon)

        expect(forecast[:attributes]).to have_key(:hourly_weather)
        expect(forecast[:attributes][:hourly_weather][0]).to have_key(:time)
        expect(forecast[:attributes][:hourly_weather][0]).to have_key(:temperature)
        expect(forecast[:attributes][:hourly_weather][0]).to have_key(:conditions)
        expect(forecast[:attributes][:hourly_weather][0]).to have_key(:icon)

        expect(forecast[:attributes]).to_not have_key(:lon)
        expect(forecast[:attributes]).to_not have_key(:lat)
        expect(forecast[:attributes]).to_not have_key(:timezone)
        expect(forecast[:attributes]).to_not have_key(:minutely)
    end
end
