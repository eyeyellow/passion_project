get '/sessions/new' do
  erb :'users/login'
end

post '/sessions' do
  if @user = User.find_by_email(params[:email])
  # remember to change it after using BCrypt
    if @user.password_hash == params[:password]
      session[:user_id] = @user.id
      redirect '/entries'
    else
      redirect '/'
    end
  else
    redirect '/'
  end
end

delete '/sessions' do
  session.delete(:user_id)
  redirect '/'
end