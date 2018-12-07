require_relative "hand.rb"
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
        @deck.shuffle!
    end

    def deal_out_cards(num_of_players=2)
        @hands = Hands.new()
        @hands.deal_in(num_of_players)
        counter = 1
        @hands.players.length.times do
            5.times do
                @hands.take_cards("Player #{counter}", @deck.pop)
            end
            counter += 1
        end
    end
    
    attr_reader :hands
    attr_reader :deck
end