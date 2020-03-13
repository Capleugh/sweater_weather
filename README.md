# Sweater Weather

## Description
Sweater Weather is an app which consumes the dark sky, google geocode, and unsplash APIs, then exposes relevant data using fast JSON:API to a front-end team which supplied us with wireframes. 

## Access Locally
* Clone this repo with: `git@github.com:Capleugh/sweater_weather.git`
* Install Ruby 2.5.1
* Install Rails 6.0.2
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
   
   
## Built With
* Ruby on Rails - web framework (version)
* [Fast JSON API](https://github.com/Netflix/fast_jsonapi/blob/master/performance_methodology.md)  
* PostgresQL - database manager
* Heorku - cloud platform for app hosting
