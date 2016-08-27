get '/entries' do
  @entries = Entry.all
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
     description: params[:description],
     entry_type_id: params[:entry_type_id])
  if @entry.save
     redirect '/entries'
  else
    erb :'entries/new'
  end

end
