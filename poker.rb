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

def array_increments?(array)
    sorted = array.sort
    last_num = sorted[0]
    sorted[1, sorted.count].each do |v|
        if last_num + 1 != v
            return false
        end
        last_num = v
    end
    true
end

class Hand_checker
    def initialize() 
        @player_got = []
    end

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
        else 
            return false
        end
    end

    def check(hash_hands)
        @counter = hash_hands.length - 1
        while @counter > -1
            @temp = hash_hands.keys[@counter]
            @suit = []
            @value = []
            hash_hands[@temp].cards.each do |card|
                @suit << card.card_suit
                @value << card.card_value
            end
            if straight_flush(@suit, @value)
                @player_got << "Player#{@counter + 1} got a Straight Flush!"
            end
            @counter -= 1
        end
    end

    attr_reader :player_got
end