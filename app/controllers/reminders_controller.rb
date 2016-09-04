post '/reminders' do
  forecast = WeatherForecast.new
  avg_daily_temp = forecast.avg_daily_temp
  @reminder = Reminder.new(
    avg_daily_temp: avg_daily_temp,
    reminder_freq: params[:reminder_freq],
    entry_date: params[:entry_date]
    )
  p @reminder.entry_date
  p @reminder.next_datetime_to_water
  p @reminder.next_date_to_water
  p @reminder.next_weekday_to_water
  redirect '/entries'
end