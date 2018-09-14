require 'sinatra'
require_relative 'poker.rb'

enable :sessions

get '/' do
  winner = session[:winner] || ""
  hand = session[:hand] || ""
  high_card = session[:high_card] || ""
  player1_cards = session[:player1_cards] || []
  player2_cards = session[:player2_cards] || []
  erb :index, :layout => :layout, locals: {winner: winner, hand: hand, high_card: high_card, player1_cards: player1_cards, player2_cards: player2_cards}
end

post '/load' do
  game = Hand_checker.new
  game.check(game.hands)
  winner = game.winner
  hand = game.player_got
  high_card = game.high_card
  player1_cards = []
  player2_cards = []
  game.hands.values[0].cards.each do |v|
    player1_cards << v.card
  end
  game.hands.values[1].cards.each do |v|
    player2_cards << v.card
  end

  session[:winner] = winner
  session[:hand] = hand
  session[:high_card] = high_card
  session[:player1_cards] = player1_cards
  session[:player2_cards] = player2_cards
  redirect '/'
end