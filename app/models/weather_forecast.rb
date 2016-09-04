require 'pp'
require 'HTTParty'

class WeatherForecast

  attr_reader :response
  include HTTParty

  def initialize(args = {})
    @key = ENV['WUND_KEY']
    @response = HTTParty.get("http://api.wunderground.com/api/ad224568eeacc7b0/forecast/q/CA/San_Francisco.json")
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


# test = WeatherForecast.new
# pp test.response