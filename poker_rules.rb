require_relative "poker.rb"
class Game
    def initialize(num_of_players=2)
        @deck = Poker_deck.new()
        @deck.deal_out_cards(num_of_players)
        @players = @deck.hands.players #to easly call on the hands
    end
    
    def break_down(player)
        @player = player
        @value_array = []
        @suit_array = []
        players_hand = @players[player][:hand]
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

    def three_match()
        copy_locator(3) ? 3 : 0
    end




    def find_hand_type()
        array_of_hand_methods = [single_pair(), three_match()]
        score = 0
        array_of_hand_methods.each do |v|
            score = v
            if score != 0
                break
            end
        end
        array_of_hand_types = ["Crap Hand", "Single Pair", "Three of a Kind"]
        @players[@player][:type] = array_of_hand_types[score]
    end


    attr_reader :players
    attr_reader :deck
end