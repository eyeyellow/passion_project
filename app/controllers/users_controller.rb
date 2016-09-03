get '/users' do
  @users = User.all
  erb :'users/index'
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i


  @user = User.new(params)

  if params[:email] =~ VALID_EMAIL_REGEX
    @user.password = params[:password]
    if @user.save
      redirect '/sessions/new'
    else
      @errors = @user.errors.full_messages
      erb :'users/new'
    end
  else
    @errors = []
    error = "invalid email. fix it please"
    @errors << error
    erb :'users/new'
  end
end

# USER SHOW
get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

# USER EDIT
get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'users/edit'
end


# USER UPDATE TODO
put '/users/:id' do
  @user = User.find(params[:id])
  @user.update(params[:category])
  redirect "/users/#{@user.id}"
end


# USER DESTROY
delete '/users/:id' do
  @user = User.find(params[:id])
  @user.destroy
  redirect "/users"
end