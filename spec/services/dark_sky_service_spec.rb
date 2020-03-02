# require 'rails_helper'
#
# RSpec.describe DarkSkyService, :vcr do
#   xit "given a city's latitudinal and longitudinal coordinates, it returns its weather forecast" do
#     dark_sky_service = DarkSkyService.new
#
#     json = dark_sky_service.get_forecast_json(coordinates)
#
# # top left box with today's high and low and current info
#     expect(json[:timezone]).to eq("America/Denver")
#     expect(json[:currently][:summary]).to eq("Mostly Cloudy")
#     expect(json[:currently][:icon]).to eq("partly-cloudy-day")
#     expect(json[:currently][:time]).to eq(1583101965)
#     expect(json[:currently][:temperature]).to eq(40.69)
#     expect(json[:daily][:data][0][:temperatureHigh]).to eq(43.57) #today's high
#     expect(json[:daily][:data][0][:temperatureLow]).to eq(25.17) #today's low
#
# # top right box with details about today's weather
#     expect(json[:currently][:summary]).to eq("Mostly Cloudy")
#     expect(json[:currently][:icon]).to eq("partly-cloudy-day")
#     expect(json[:currently][:apparentTemperature]).to eq(35.98)
#     expect(json[:currently][:humidity]).to eq(0.57)
#     expect(json[:currently][:visibility]).to eq(10)
#     expect(json[:currently][:uvIndex]).to eq(1)
#     expect(json[:daily][:summary]).to eq("Possible light snow today.")
#     expect(json[:daily][:data][0][:summary]).to eq("Possible light snow tonight.")
#
# # bottom box with hourly and daily forecast information
#     #hourly
#     expect(json[:hourly][:data][0][:time]).to eq(1583100000)
#     expect(json[:hourly][:data][1][:time]).to eq(1583103600)
#     expect(json[:hourly][:data][2][:time]).to eq(1583107200)
#     expect(json[:hourly][:data][3][:time]).to eq(1583110800)
#     expect(json[:hourly][:data][4][:time]).to eq(1583114400)
#     expect(json[:hourly][:data][5][:time]).to eq(1583118000)
#     expect(json[:hourly][:data][6][:time]).to eq(1583121600)
#     expect(json[:hourly][:data][7][:time]).to eq(1583125200)
#     expect(json[:hourly][:data][0][:icon]).to eq("partly-cloudy-day")
#     expect(json[:hourly][:data][1][:icon]).to eq("partly-cloudy-day")
#     expect(json[:hourly][:data][2][:icon]).to eq("rain")
#     expect(json[:hourly][:data][3][:icon]).to eq("partly-cloudy-night")
#     expect(json[:hourly][:data][4][:icon]).to eq("snow")
#     expect(json[:hourly][:data][5][:icon]).to eq("snow")
#     expect(json[:hourly][:data][6][:icon]).to eq("snow")
#     expect(json[:hourly][:data][7][:icon]).to eq("fog")
#     expect(json[:hourly][:data][0][:temperature]).to eq(42.24)
#     expect(json[:hourly][:data][1][:temperature]).to eq(40.46)
#     expect(json[:hourly][:data][2][:temperature]).to eq(38.19)
#     expect(json[:hourly][:data][3][:temperature]).to eq(37.38)
#     expect(json[:hourly][:data][4][:temperature]).to eq(36.99)
#     expect(json[:hourly][:data][5][:temperature]).to eq(34.42)
#     expect(json[:hourly][:data][6][:temperature]).to eq(33.33)
#     expect(json[:hourly][:data][7][:temperature]).to eq(32.03)
#
#     #daily
#     expect(json[:daily][:data][0][:time])
#     expect(json[:daily][:data][1][:time])
#     expect(json[:daily][:data][2][:time])
#     expect(json[:daily][:data][3][:time])
#     expect(json[:daily][:data][4][:time])
#     expect(json[:daily][:data][0][:icon])
#     expect(json[:daily][:data][1][:icon])
#     expect(json[:daily][:data][2][:icon])
#     expect(json[:daily][:data][3][:icon])
#     expect(json[:daily][:data][4][:icon])
#     expect(json[:daily][:data][0][:precipProbability])
#     expect(json[:daily][:data][1][:precipProbability])
#     expect(json[:daily][:data][2][:precipProbability])
#     expect(json[:daily][:data][3][:precipProbability])
#     expect(json[:daily][:data][4][:precipProbability])
#     expect(json[:daily][:data][0][:temperatureHigh])
#     expect(json[:daily][:data][1][:temperatureHigh])
#     expect(json[:daily][:data][2][:temperatureHigh])
#     expect(json[:daily][:data][3][:temperatureHigh])
#     expect(json[:daily][:data][4][:temperatureHigh])
#     expect(json[:daily][:data][0][:temperatureLow])
#     expect(json[:daily][:data][1][:temperatureLow])
#     expect(json[:daily][:data][2][:temperatureLow])
#     expect(json[:daily][:data][3][:temperatureLow])
#     expect(json[:daily][:data][4][:temperatureLow])
#   end
# end
