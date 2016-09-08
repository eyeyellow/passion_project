get '/entries' do
  user_id = session[:user_id]
  @user = User.find_by_id(user_id)
  @entries = Entry.where(user_id: user_id)
  @forecast = WeatherForecast.new
  @forecast_data = @forecast.four_day_forecast
  p @forecast_data
  erb :'entries/index'
end

get '/entries/new' do
  @entry_types = EntryType.all
  erb :'entries/new'
end

post '/entries' do
  p params
  @entry = Entry.new(
    title: params[:title],
    user: User.find_by_id(session[:user_id]),
    description: params[:description],
    entry_type_id: params[:entry_type_id])
  if @entry.save
     redirect '/entries'
  else
    erb :'entries/new'
  end

end

get '/entries/:id' do
  @entry = Entry.find(params[:id])
  p @entry.description
  @entry_type = @entry.entry_type
  if request.xhr?
    erb :'/entries/_show', locals: {entry: @entry}, layout: false
  else
    erb :'entries/show'
  end
end

get '/entries/:id/edit' do
  @entry_types = EntryType.all
  @entry = Entry.find(params[:id])
  erb :'entries/edit'
end

put '/entries/:id' do
  @entry = Entry.find(params[:id])
  @entry.assign_attributes(title: params[:title], description: params[:description])
  if @entry.save
    redirect '/entries'
  else
    erb :'entries/edit'
  end
end

get '/entries/:id/delete' do
  @entry = Entry.find(params[:id])
  erb :'entries/delete'
end

delete '/entries/:id' do
  @entry = Entry.find(params[:id])
  @entry.destroy
  redirect '/entries'
end
