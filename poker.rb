class Deck
    def initialize()
        @values = ["2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A"]
        @suites = ["C", "D", "H", "S"]
        @deck = []
        @suites.each do |v|
            @values.each do |card|
                @deck << "#{card}#{v}"
            end
        end
        @deck
    end

    def shuffle()
        @deck = @deck.shuffle!
    end

    def deal(players)
        @hands = Hash.new
        @cards_per_hand = 5
        while players > 0
            @hands["player#{players}"] = []
            players -= 1
        end
        @temp = @hands.values
        @cards_per_hand.times do
            @hands.each do |key, value|
                value << @deck.pop
                @hands[key] = value
            end
        end
        @hands
    end

    attr_accessor :cards_per_hand
    attr_reader :hands
    attr_reader :deck
end

class Card
    def initialize(card)
        @card = card
        @temp_card = @card.split("")
        @card_value = @temp_card[0]
        if @card_value.to_i == 0
            case @card_value
            when "T"
                @card_value = "10"
            when "J"
                @card_suite = "11"
            when "Q"
                @card_value = "12"
            when "K"
                @card_value = "13"
            when "A"
                @card_value = "14"
            end
        end
        @card_suite = @temp_card[1]
        case @card_suite
        when "S"
            @card_suite = "Spades"
        when "C"
            @card_suite = "Clubs"
        when "D"
            @card_suite = "Diamonds"
        when "H"
            @card_suite = "Hearts"
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
    attr_reader :card_suite
    attr_reader :card_longhand
end

class Hand
    def initialize()
        @cards = []
    end

    attr_accessor :cards
end



# class Score
#     def initialize(cards)
#         @score = 0
#         cards.each do |hand|
#             hand.each do |v|
#                 @temp = v.slice(0)
#                 if @temp.to_i > 1
#                     @score += @temp.to_i
#                 else
#                     case @temp
#                     when "T"
#                         @score += 10
#                     when "J"
#                         @score += 11
#                     when "Q"
#                         @score += 12
#                     when "K"
#                         @score += 13
#                     when "A"
#                         @score += 14
#                     end
#                 end
#             end
#         end
#         @score
#     end
# end