require_relative "poker.rb"
class Game
    def initialize(num_of_players=2)
        @deck = Poker_deck.new()
        @deck.deal_out_cards(num_of_players)
        @players = @deck.hands.players #to easly call on the hands
    end
    
    attr_reader :players
    attr_reader :deck
end