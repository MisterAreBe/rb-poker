class Card
    def initialize(card)
        @card = card
        @temp_card = @card.split("")
        @card_value = @temp_card[0]
        case @card_value
        when "T"
            @card_value = 10
        when "J"
            @card_value = 11
        when "Q"
            @card_value = 12
        when "K"
            @card_value = 13
        when "A"
            @card_value = 14
        else
            @card_value = @card_value.to_i
        end
        @card_suit = @temp_card[1]
        case @card_suit
        when "S"
            @card_suit = "Spades"
        when "C"
            @card_suit = "Clubs"
        when "D"
            @card_suit = "Diamonds"
        when "H"
            @card_suit = "Hearts"
        end
        @card_longhand = ""
        @temp_card.each do |v|
            case v.upcase
            when "2"
                @card_longhand += "Two"
            when "3"
                @card_longhand += "Three"
            when "4"
                @card_longhand += "Four"
            when "5"
                @card_longhand += "Five"
            when "6"
                @card_longhand += "Six"
            when "7"
                @card_longhand += "Seven"
            when "8"
                @card_longhand += "Eight"
            when "9"
                @card_longhand += "Nine"
            when "T"
                @card_longhand += "Ten"
            when "J"
                @card_longhand += "Jack"
            when "Q"
                @card_longhand += "Queen"
            when "K"
                @card_longhand += "King"
            when "A"
                @card_longhand += "Ace"
            when "S"
                @card_longhand += " of Spades"
            when "D"
                @card_longhand += " of Diamonds"
            when "H"
                @card_longhand += " of Hearts"
            when "C"
                @card_longhand += " of Clubs"
            end
        end
    end

    def ==(y)
        if @card == y.card
            return true
        end
        return false 
    end

    attr_reader :card
    attr_reader :card_value
    attr_reader :card_suit
    attr_reader :card_longhand
end

class Hand
    def initialize()
        @cards = []
    end

    def add(card)
        @cards << card
    end

    attr_accessor :cards
end

class Deck
    def initialize()
        @values = ["2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A"]
        @suits = ["C", "D", "H", "S"]
        @deck = []
        @suits.each do |v|
            @values.each do |card|
                @deck << Card.new("#{card}#{v}")
            end
        end
        @deck
    end

    def shuffle()
        @deck = @deck.shuffle!
    end

    def deal(players)
        @cards_per_hand = 5
        @hand_list = Hash.new
        while players > 0
            @hand = Hand.new
            @hand_list["player#{players}"] = @hand
            players -= 1
        end
        @cards_per_hand.times do
            @hand_list.each do |key,value|
                value.add(@deck.pop)
            end
        end
    end

    attr_accessor :cards_per_hand
    attr_reader :hand_list
    attr_reader :deck
end

class Hand_checker
    def initialize() 
        @player_got = []
        @high_card = []
    end

    # Used to see if the cards run
    def array_increments?(array)
        @sorted = array.sort
        @last_num = @sorted[0]
        @sorted[1, @sorted.count].each do |v|
            if @last_num + 1 != v
                return false
            end
            @last_num = v
        end
        true
    end

    # Used to sort hand objects
    def matcher(card_list, matched, limit)
        holder = []
        sorted = []
        card_list.each do |v|
            holder << v.card_value
        end
        holder.each_with_index do |v, i|
            checker = 0
            card_list.each do |x|
                if v == x.card_value
                    checker += 1
                end
            end
            if checker == matched
                sorted << card_list[i]
            end
            if sorted.length == limit
                return sorted
            end
        end
        []
    end

    # Used to find the highest value card in the hand
    def high_card?(card_list)
        @num_list = []
        if card_list.length < 5
            card_list.each do |v|
                if v.is_a?(Array)
                    if v.length >= 2 && v.length <= 4
                        v.each do |x|
                            @num_list << x.card_value
                        end
                    end
                    @num_list.sort!
                    @highest = @num_list[-1]
                    v.each do |x|
                        if x.card_value == @highest
                            return x.card_longhand
                        end
                    end
                end
            end
        else
            card_list.each do |v|
                @num_list << v.card_value
            end
            @num_list.sort!
            @highest = @num_list[-1]
            card_list.each do |v|
                if v.card_value == @highest
                    return v.card_longhand
                end
            end
        end
    end

    # Used to check if hand is a straight flush
    def straight_flush(suit,value)
        @is_suit = false
        @is_flush = false
        if suit.all? {|x| x == suit[0]}
            @is_suit = true
        end
        if array_increments?(value)
            @is_flush = true
        end
        if @is_suit && @is_flush
            return true 
        end
        false
    end

    # Used to check if the hand is a four of a kind
    def four_kind(card_list, back)
        temp = matcher(card_list, 4, 4)

        if temp.is_a?(Array)
            if temp.length == 4
                if back == 0
                    return true
                else
                    holder = []; holder << temp
                    return holder
                end
            end
        end
        false
    end

    # Used to check if the hand is a full house
    def full_house(card_list, back)
        tres = matcher(card_list, 3, 3)
        duce = matcher(card_list, 2, 2)
        holder = []; holder << tres; holder << duce
        if tres.is_a?(Array) && duce.is_a?(Array)
            if holder[0].length == 3 && holder[1].length == 2
                if back == 0
                    return true
                else
                    return holder
                end
            end
        end
        false
    end

    # Used to check if the hand is a flush
    def flush(suit)
        if suit.all? {|x| x == suit[0]}
            return true
        end
        false
    end

    # Used to check if the hand is a straight
    def straight(value)
        if array_increments?(value)
            return true
        end
        false
    end

    # Used to check if the hand is a three of a kind
    def three_kind(card_list, back)
        tres = matcher(card_list, 3, 3)
        holder = []; holder << tres
        if tres.is_a?(Array) && back == 0
            if tres.length == 3; return true; end
        elsif tres.is_a?(Array) && back == 1
            if tres.length == 3; return holder; end
        end
        false
    end

    # Used to check is the hand is two pairs
    def two_pairs(card_list, back)
        temp = []
        pair1 = matcher(card_list, 2, 2)
        temp << card_list.select {|x| x.card_value != pair1[0].card_value}
        temp.flatten!
        pair2 = matcher(temp, 2, 2)
        holder = []; holder << pair1; holder << pair2
        if pair1.is_a?(Array) && pair2.is_a?(Array)
            if pair1.length == 2 && pair2.length == 2
                if back == 0
                    return true
                elsif back == 1
                    return holder
                end
            end
        end
        false
    end


    # Used to check the dealt hands
    def check(hash_hands)
        @counter = hash_hands.length - 1
        while @counter > -1
            @temp = hash_hands.keys[@counter]
            @suit = []
            @value = []
            @card_list = []
            
            hash_hands[@temp].cards.each do |card|
                @suit << card.card_suit
                @value << card.card_value
                @card_list << card
            end

            @got_string = "Player#{@counter + 1} got, a "
            @how_to = "#{high_card?(@card_list)}"

            if straight_flush(@suit, @value)
                @player_got << "#{@got_string}Straight Flush!"
            elsif four_kind(@card_list, 0)
                @player_got << "#{@got_string}Four of a Kind!"
                @holder = four_kind(@card_list, 1)
                @how_to = "#{high_card?(@holder)}"
            elsif full_house(@card_list, 0)
                @player_got << "#{@got_string}Full House!"
                @holder = full_house(@card_list, 1)
                @how_to = "#{high_card?(@holder)}"
            elsif flush(@suit)
                @player_got << "#{@got_string}Flush!"
            elsif straight(@value)
                @player_got << "#{@got_string}Straight!"
            elsif three_kind(@card_list, 0)
                @player_got << "#{@got_string}Three of a Kind!"
                @holder = three_kind(@card_list, 1)
                @how_to = "#{high_card?(@holder)}"
            elsif two_pairs(@card_list, 0)
                @player_got << "#{@got_string}Two Pairs!"
                @holder = two_pairs(@card_list, 1)
                @how_to = "#{high_card?(@holder)}"
            end

            @high_card << "Player#{@counter + 1}'s high card is #{@how_to}"
            @counter -= 1
        end
    end

    attr_reader :player_got
    attr_reader :high_card
end