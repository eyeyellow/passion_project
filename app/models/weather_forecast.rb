require 'pp'
require 'HTTParty'
require 'dotenv'


class WeatherForecast

  attr_reader :response
  include HTTParty
  Dotenv.load("../../.env")

  # Dotenv.load("~/Desktop/passion_project/.env")

  def initialize(args = {})
    @response = HTTParty.get(ENV['WEATHER_KEY'].to_s)
    @forecast = @response['forecast']
    @txt_forecast = @forecast['txt_forecast']
    @txt_simple_forecast = @txt_forecast['forecastday']
    @simpleforecast = @forecast['simpleforecast']
    @forecastday = @simpleforecast['forecastday']
  end

  def avg_four_day_temp
    # returns 4-element array of average daily temperatures
    @forecastday.map! do |day|
      high = day['high']['fahrenheit'].to_i
      low = day['low']['fahrenheit'].to_i
      ( high + low ) / 2
    end
  end

  def avg_daily_temp
    # takes average of daily temperatures to send to reminder class
    avg_four_day_temp.reduce(:+) / 4
  end

  def four_day_forecast
    # return array of hashes with:
    # icon_url, title, fcttext
    @forecastday.map! do |day|
      icon_url = day['icon_url']
      date = "#{day['date']['weekday']} #{day['date']['monthname_short']} #{day['date']['day']}"
      conditions = day['conditions']
      {icon_url: icon_url, date: date, conditions: conditions}
    end
  end

end

# test = WeatherForecast.new
# pp test.four_day_forecast