require_relative "poker.rb"
class Game
    def initialize()
        @deck = Poker_deck.new()
    end
    
    attr_reader :deck
end