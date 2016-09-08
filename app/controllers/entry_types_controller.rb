get '/entry_types/new' do
  @entry_types = EntryType.all
  erb :'entry_types/new'
end


post '/entry_types' do
  @entry_type = EntryType.new(params)
  if @entry_type.save
    p @entry_type
    redirect '/entries/new'
  else
    erb :'entry_types/new'
  end
end

