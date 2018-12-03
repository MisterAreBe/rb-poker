require_relative "poker.rb"
class Poker_deck
    def initialize()
        @deck = Array.new()
    end

    
    attr_reader :deck
end