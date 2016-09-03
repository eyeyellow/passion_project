get '/' do
  # Look in app/views/index.erb
  @logged_in = session[:user_id] != nil
  p session.inspect
  p @logged_in
  erb :index
end
