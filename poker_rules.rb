require_relative "poker.rb"
class Game
    def initialize(num_of_players=2)
        @deck = Poker_deck.new()
        @deck.deal_out_cards(num_of_players)
        @players = @deck.hands.players #to easly call on the hands
    end
    
    def break_down(players_hand)
        @value_array = []
        @suit_array = []
        players_hand.each do |v|
            @value_array << v.card_value
            @suit_array << v.card_suit
        end
        [@value_array, @suit_array]
    end

    def copy_locator(copies=1)
        @value_array.each do |v|
            if @value_array.count(v) == copies
                return true
            end
        end
        false
    end

    def single_pair()
        copy_locator(2) ? 1 : 0
    end

    attr_reader :players
    attr_reader :deck
end