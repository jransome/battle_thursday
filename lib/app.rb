require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    Game.instance.add_players(player_1,player_2)
    # $game = Game.new(player_1,player_2)
    redirect '/play'
  end

  get '/play' do
    @attack_confirmation = Game.instance.attack_confirmation(session[:last_move])
    Game.instance.switch_turn unless @attack_confirmation.empty?
    @player_1 = Game.instance.players.first
    @player_2 = Game.instance.players.last
    @turn = Game.instance.turn
    erb :play
  end

  post '/attacked' do
    session[:last_move] = params[:attack]
    Game.instance.attack
    redirect '/game_over' if Game.instance.ended?
    redirect '/play'
  end

  get '/game_over' do
    erb :game_over
  end

  run! if app_file == $0
end
