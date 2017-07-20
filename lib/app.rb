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
    $game = Game.new(player_1,player_2)
    redirect '/play'
  end

  get '/play' do
    @attack_confirmation = $game.attack_confirmation(session[:last_move])
    $game.switch_turn unless @attack_confirmation.empty?
    @player_1 = $game.players.first
    @player_2 = $game.players.last
    @turn = $game.turn
    erb :play
  end

  post '/attacked' do
    session[:last_move] = params[:attack]
    $game.attack
    redirect '/play'
  end

  run! if app_file == $0
end
