require 'sinatra/base'
require 'player'

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
    last_move = session[:last_move]
    attack_confirmation = ''
    if last_move == 'Attack'
      attack_confirmation = "#{@player_1_name} has attacked #{@player_2_name}"
    end
    erb :play, { locals: { player_1_hp: player_1_hp, player_2_hp: player_2_hp, attack_confirmation: attack_confirmation } }
  end

  post '/attacked' do
    session[:last_move] = params[:attack]
    redirect '/play'
  end

  run! if app_file == $0
end
