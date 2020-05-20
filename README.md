# Sweater Weather

## Description
Sweater Weather is an API only application designed to expose forecast and road trip data relevant to wireframes supplied by a front-end team. The exposure is enabled by the consumption of third party APIs.

## Access Locally
* Clone this repo with: `git@github.com:Capleugh/sweater_weather.git`
* Run `$ bundle install`
* Run `$ rails db:setup`
* This application uses the following gems for testing, which are included in the gemfile:
   * `fast_jsonapi`
   * `rspec-rails`
   * `capybara`
   * `shoulda-matchers`
   * `webmock`
   * `vcr`
 * This application uses the following gems for development, which are also included in the gemfile:
   * `figaro`
   * `faraday`
   * `bcrypt`
   
## Endpoints
Root URL for any endpoint in this application: 
`https://weather-for-a-sweater.herokuapp.com/api/v1`

* All responses formatted as JSON
* It is important to note that POST requests should be made in Postman in order to see a response rendered

### Forecast
`GET /forecast`
##### Sample Request
`https://weather-for-a-sweater.herokuapp.com/api/v1/forecast?location=denver,co`
##### Sample Response
```
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "timezone": "America/Denver",
            "location": {
                "city": "Denver",
                "state": "CO",
                "country": "United States"
            },
            "forecast_currently": {
                "summary": "Clear",
                "icon": "clear-day",
                "time": 1583341705,
                "temp": 58.17,
                "high": 62.75,
                "low": 29.16,
                "location": {
                    "city": "Denver",
                    "state": "CO",
                    "country": "United States"
                }
            },
            "forecast_currently_details": {
                "icon": "clear-day",
                "today": "Possible light rain on Monday.",
                "tonight": "Partly cloudy throughout the day.",
                "feels_like": 58.28,
                "humidity": 0.15,
                "visibility": 10,
                "uv_index": 3
            },
            "forecast_hourly": [
                {
                    "time": 1583341200,
                    "icon": "clear-day",
                    "temp": 57.33
                },
                {
                    "time": 1583344800,
                    "icon": "clear-day",
                    "temp": 61.83
                },
                {
                    "time": 1583348400,
                    "icon": "clear-day",
                    "temp": 61.85
                },
                {
                    "time": 1583352000,
                    "icon": "partly-cloudy-day",
                    "temp": 61.35
                },
                {
                    "time": 1583355600,
                    "icon": "partly-cloudy-day",
                    "temp": 62.25
                },
                {
                    "time": 1583359200,
                    "icon": "partly-cloudy-day",
                    "temp": 61.47
                },
                {
                    "time": 1583362800,
                    "icon": "partly-cloudy-day",
                    "temp": 59.63
                },
                {
                    "time": 1583366400,
                    "icon": "partly-cloudy-day",
                    "temp": 56.74
                }
            ],
            "forecast_daily": [
                {
                    "time": 1583305200,
                    "icon": "partly-cloudy-day",
                    "precip_chance": 0.01,
                    "high": 62.75,
                    "low": 29.16
                },
                {
                    "time": 1583391600,
                    "icon": "clear-day",
                    "precip_chance": 0.01,
                    "high": 58.86,
                    "low": 30.96
                },
                {
                    "time": 1583478000,
                    "icon": "partly-cloudy-day",
                    "precip_chance": 0.02,
                    "high": 67.78,
                    "low": 35.52
                },
                {
                    "time": 1583564400,
                    "icon": "partly-cloudy-day",
                    "precip_chance": 0.03,
                    "high": 64.24,
                    "low": 39.87
                },
                {
                    "time": 1583650800,
                    "icon": "partly-cloudy-day",
                    "precip_chance": 0.28,
                    "high": 65.39,
                    "low": 39.06
                }
            ]
        }
    }
}
```

### Background
`GET /backgrounds`
##### Sample Request
`https://weather-for-a-sweater.herokuapp.com/api/v1/backgrounds?location=denver,co`
##### Sample Response
```
{
    "data": {
        "id": null,
        "type": "background",
        "attributes": {
            "image": "https://images.unsplash.com/photo-1519424187720-db6d0fc5a5d2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjExODU4NH0"
        }
    }
}
```

### Registration 
`POST /users`
##### Sample Request
`https://weather-for-a-sweater.herokuapp.com/api/v1/users?email=corndog@example.com&password=password&password_confirmation=password`
##### Sample Response
```
{
    "data": {
        "id": "4",
        "type": "user",
        "attributes": {
            "id": 4,
            "api_key": "SwWbgFAQhpKKgdqTcfyds8oU"
        }
    }
}
```

### Login 
`POST /sessions`
##### Sample Request
`https://weather-for-a-sweater.herokuapp.com/api/v1/sessions?email=corndog@example.com&password=password`
##### Sample Response
```
{
    "data": {
        "id": "4",
        "type": "user",
        "attributes": {
            "id": 4,
            "api_key": "SwWbgFAQhpKKgdqTcfyds8oU"
        }
    }
}
```

### Road Trip Info
`POST /road_trip`
##### Sample Request
`https://weather-for-a-sweater.herokuapp.com//api/v1/road_trip?origin=Denver, CO&destination=Dallas, TX&api_key=SwWbgFAQhpKKgdqTcfyds8oU`
##### Sample Response
```
{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "origin": "Denver, CO",
            "destination": "Dallas, TX",
            "travel_time": "12 hours 4 mins",
            "forecast": {
                "summary": "Overcast",
                "temp": 67.15
            }
        }
    }
}
```


## Technologies
* Rails 6.0.2.1
* [Fast JSON API](https://github.com/Netflix/fast_jsonapi/blob/master/performance_methodology.md)
* Third-party APIs:
  * DarkSky API
  * Google Geocoding API
  * Unsplash API  
* PostgreSQL - database manager
* Heroku - cloud platform for app hosting
