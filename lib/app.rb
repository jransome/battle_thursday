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

    @player_1 = $game.players.first
    @player_2 = $game.players.last

    last_move = session[:last_move]
    attack_confirmation = ''
    if last_move == 'Attack'
      attack_confirmation = "#{@player_1.name} has attacked #{@player_2.name}"
    end
    erb :play, { locals: { attack_confirmation: attack_confirmation } }
  end

  post '/attacked' do
    @player_2 = $game.players.last
    session[:last_move] = params[:attack]
    $game.attack(@player_2)
    redirect '/play'
  end

  run! if app_file == $0
end
