get '/users/new' do
  erb :'users/new'
end

post '/users' do
  VALID_EMAIL_REGEX = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  if params[:user][:email] =~ VALID_EMAIL_REGEX
    p params[:user][:password]
    p params[:confirm_password]
    if params[:user][:password] == params[:confirm_password]
      @user = User.new(params[:user])
      if @user.save
        redirect '/'
      else
        @error = "Please fill out all forms."
        erb :'users/new'
      end
    else
      @error = "Passwords do not match."
      erb :'users/new'
    end
  else
    @error = "Invalid email."
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