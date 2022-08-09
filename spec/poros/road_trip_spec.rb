require 'rails_helper'

RSpec.describe RoadTrip do
  it 'can display road trip information less tahne 48 hours' do
    route_data = {hasTollRoad: false,
                  hasBridge: true,
                  boundingBox: {lr: {lng: -104.60508, lat: 38.265427}, ul: {lng: -104.987602, lat: 39.738453}},
                  distance: 111.387,
                  formattedTime: "01:45:23",
                  realTime: 6589,
                  locations: [{adminArea4: "Denver County",
                                adminArea5: "Denver",
                                adminArea3: "CO"},
                               {adminArea4: "Pueblo County",
                                adminArea5: "Pueblo",
                                adminArea3: "CO"}]}
    data = { current: 'Todays weather data',
               daily: [{weather: [{description: 'Day One Weather'}],
                        temp: {day: 100}},
                       {weather: [{description: 'Day Two Weather'}],
                        temp: {day: 200}},
                       {weather: [{description: 'Day Three Weather'}],
                        temp: {day: 200}}],
              hourly: [{weather: [{description: 'Hour One Weather'}],
                        temp: 100 },
                       {weather: [{description: 'Hour Two Weather'}],
                        temp: 200},
                       {weather: [{description: 'Hour Three Weather'}],
                        temp: 300}]}

    forecast_data = Forecast.new(data)
    road_trip = RoadTrip.new(route_data, forecast_data)

    expect(road_trip).to be_a(RoadTrip)

    expect(road_trip.conditions).to eq('Hour Two Weather')
    expect(road_trip.temperature).to eq("200")
    expect(road_trip.start_city).to eq("Denver, CO")
    expect(road_trip.end_city).to eq("Pueblo, CO")
    expect(road_trip.travel_time).to eq("01 hour(s), 45 minutes")
  end

  it 'can display road trip information greater than 48 hours' do
    route_data = {hasTollRoad: false,
                  hasBridge: true,
                  boundingBox: {lr: {lng: -104.60508, lat: 38.265427}, ul: {lng: -104.987602, lat: 39.738453}},
                  distance: 111.387,
                  formattedTime: "49:45:23",
                  realTime: 6589,
                  locations: [{adminArea4: "Denver County",
                                adminArea5: "Denver",
                                adminArea3: "CO"},
                               {adminArea4: "San Francisco County",
                                adminArea5: "San Francisco",
                                adminArea3: "CA"}]}
    data = { current: 'Todays weather data',
               daily: [{weather: [{description: 'Day One Weather'}],
                        temp: {day: 100}},
                       {weather: [{description: 'Day Two Weather'}],
                        temp: {day: 200}},
                       {weather: [{description: 'Day Three Weather'}],
                        temp: {day: 200}}],
              hourly: [{weather: [{description: 'Hour One Weather'}],
                        temp: 100 },
                       {weather: [{description: 'Hour Two Weather'}],
                        temp: 200},
                       {weather: [{description: 'Hour Three Weather'}],
                        temp: 300}]}

    forecast_data = Forecast.new(data)
    road_trip = RoadTrip.new(route_data, forecast_data)

    expect(road_trip).to be_a(RoadTrip)

    expect(road_trip.conditions).to eq('Day Two Weather')
    expect(road_trip.temperature).to eq("200")
    expect(road_trip.start_city).to eq("Denver, CO")
    expect(road_trip.end_city).to eq("San Francisco, CA")
    expect(road_trip.travel_time).to eq("49 hour(s), 45 minutes")
  end
end
