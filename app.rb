require 'sinatra'
require_relative 'poker_rules.rb'

enable :sessions

get '/' do
  player1 = session[:player1] || {:hand => []}
  player2 = session[:player2] || {:hand => []}
  winner = session[:winner] || ""
  erb :index, :layout => :layout, locals: {player1: player1, player2: player2, winner: winner}
end

post '/load' do
  game = Game.new()
  session[:winner] = game.play()
  session[:player1] = game.players["Player 1"]
  session[:player2] = game.players["Player 2"]
  redirect '/'
end