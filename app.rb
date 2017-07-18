require 'sinatra'
require 'shotgun'

get '/' do
  "Hello World"
end

get '/random_cat' do
  @names = ["Amigo", "Oscar", "Viking"].sample
  erb(:index)
end

get '/form' do
  erb(:form)
end

post '/named_cat' do
  @names = params[:name]
  erb(:index)
end
