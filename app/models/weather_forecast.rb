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

end
