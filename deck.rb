require_relative "poker.rb"
class Poker_deck
    def initialize()
        values = ["2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A"]
        suits = ["C", "D", "S", "H"]
        @deck = []
        suits.each do |suite|
            values.each do |value|
                @deck << Cards.new(["#{value}", "#{suite}"])
            end
        end
    end

    
    attr_reader :deck
end