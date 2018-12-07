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

    def two_pair()
        first_pair = []
        @value_array.each do |v|
            @value_array.count(v) == 2 ? first_pair << v : 0
        end
        hand_without_first_pair = @value_array.select {|v| first_pair[0] != v}
        hand_without_first_pair.each do |v|
            hand_without_first_pair.count(v) == 2 ? first_pair << true : 0
        end
        return first_pair.include?(true) ? 2 : 0
    end

    def three_match()
        copy_locator(3) ? 3 : 0
    end

    def straight()
        @value_array.sort.each_cons(2).all? {|num1,num2| num2 == num1 + 1} ? 4 : 0
    end

    def flush()
        @suit_array.uniq.length == 1 ? 5 : 0
    end

    def full_house()
        copy_locator(3) && copy_locator(2) ? 6 : 0
    end

    def four_match()
        copy_locator(4) ? 7 : 0
    end

    def straight_flush()
        straight() + flush() == 9 ? 8 : 0
    end

    def find_hand_type()
        array_of_hand_methods = [straight_flush(), four_match(), full_house(), flush(), straight(), three_match(), two_pair(), single_pair()]
        score = 0
        array_of_hand_methods.each do |v|
            score = v
            if score != 0
                break
            end
        end
        array_of_hand_types = ["Crap Hand", "Single Pair", "Two Pairs", "Three of a Kind", "Straight", "Flush", "Full House", "Four of a Kind", "Straight Flush"]
        @players[@player][:type] = array_of_hand_types[score]
    end


    attr_reader :players
    attr_reader :deck
end