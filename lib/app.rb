require 'sinatra/base'

class Battle < Sinatra::Base
  enable :sessions
  get '/' do
    erb :index
  end

  post '/names' do
    session[:player_1_name] = params[:player_1_name]
    session[:player_2_name] = params[:player_2_name]
    redirect '/play'
  end

  get '/play' do
    player_1_hp, player_2_hp = 100, 100
    @player_1_name = session[:player_1_name]
    @player_2_name = session[:player_2_name]
    erb :play, { locals: { player_1_hp: player_1_hp, player_2_hp: player_2_hp } }
  end

  run! if app_file == $0
end
