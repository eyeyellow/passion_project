get '/sessions/new' do
  erb :'users/login'
end

post '/sessions' do
  if @user = User.find_by_email(params[:email])
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      p "successful login"
      redirect '/entries'
    else
      redirect '/'
      p "no password match"
    end
  else
    p "user not found"
    redirect '/'
  end
end

delete '/sessions' do
  session.delete(:user_id)
  redirect '/'
end