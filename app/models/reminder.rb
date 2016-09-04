require 'date'

class Reminder

  attr_reader :entry_date

  def initialize(args = {})
    # send from entry_types.reminder_freq
    @reminder_freq = args[:reminder_freq].to_i
    # send from weather_forecast.avg_daily_temp
    @avg_daily_temp = args[:avg_daily_temp]
    # send from entries.created_at
    # passes in a datetime object, returns date
    @entry_date = args[:entry_date].to_date
  end

  def days_till_next_water
    if @avg_daily_temp < 70
      @reminder_freq * 2
    elsif @avg_daily_temp >= 70 && @avg_daily_temp < 85
      @reminder_freq * 1
    else
      @reminder_freq * 0.5
    end
  end

  def next_datetime_to_water
    # returns a datetime object...
    # @entry_date + days_till_next_water
    @entry_date.next_day(days_till_next_water)
  end

  def next_date_to_water
    next_datetime_to_water.to_s
  end

  def next_weekday_to_water
    next_datetime_to_water.strftime('%A')
  end

end

# Test methods with sample input data

# test_hash = {reminder_freq: 1, avg_daily_temp: 61, entry_date: DateTime.now}
# reminder = Reminder.new(test_hash)
# p reminder.entry_date
# p reminder.next_datetime_to_water
# p reminder.next_date_to_water
# p reminder.next_weekday_to_water