post '/reminders' do
  forecast = WeatherForecast.new
  avg_daily_temp = forecast.avg_daily_temp
  @reminder = Reminder.new(
    avg_daily_temp: avg_daily_temp,
    reminder_freq: params[:reminder_freq],
    entry_date: params[:entry_date]
    )
  @entry_type_name = params[:entry_type_name]
  p @reminder.entry_date
  p @reminder.next_datetime_to_water
  p @reminder.next_date_to_water
  p @reminder.next_weekday_to_water
  if request.xhr?
    content_type :html
    erb :'/entries/_reminder', locals: {reminder: @reminder, entry_type_name: @entry_type_name}, layout: false
  else
    erb :'/entries/reminder'
  end
end