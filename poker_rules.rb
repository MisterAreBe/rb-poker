require_relative "deck.rb"
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

    def copy_locator(copies)
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

    def uniq_hand_order(copies)
        ordered_array = []
        temp_array = @value_array.sort.reverse
        temp_array.each do |v|
            if temp_array.count(v) == copies
                ordered_array << v
            end
        end
        return ordered_array
    end

    def non_uniq_hand_order(ordered_array)
        temp_array = @value_array.sort.reverse - ordered_array
        num = temp_array.length; temp_array.sort!
        num.times do
            ordered_array << temp_array.pop()
        end
        return ordered_array
    end

    def order_hand_hi_to_low(copies=1)
        ordered_array = uniq_hand_order(copies)
        unless ordered_array.length == 5
            ordered_array = non_uniq_hand_order(ordered_array)
        end
        @players[@player][:score][1] = ordered_array
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
        @players[@player][:score][0] += score
    end

    def convert_hand_score_to_high_card()
        hand_to_high_card = {2 => [1, 2], 3 => [3, 6], 4 => [4]}
        hand_to_high_card.each_pair do |k, v|
            if v.include?(@players[@player][:score][0])
                order_hand_hi_to_low(k)
            end
        end
        if @players[@player][:score][1] == 0
            order_hand_hi_to_low()
        end
    end

    def compare_hand_types()
        @players["Player 1"][:score][0] <=> @players["Player 2"][:score][0]
    end

    def compare_high_cards()
        5.times do |v|
            temp = @players["Player 1"][:score][1][v] <=> @players["Player 2"][:score][1][v]
            if temp != 0
            return temp
            end
        end
    end

    def compare_hands()
        winner = {1 => "Player 1 Wins!", -1 => "Player 2 Wins!"}
        if winner.has_key?(compare_hand_types())
            return winner[compare_hand_types()]
        elsif winner.has_key?(compare_high_cards())
            return winner[compare_high_cards()]
        else
            return "It's a Tie!"
        end
    end

    def play()
        @players.keys.length.times do |v|
            break_down(@players.keys[v])
            find_hand_type()
            convert_hand_score_to_high_card()
        end
        return compare_hands()
    end

    attr_reader :players
    attr_reader :deck
end