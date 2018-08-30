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
    def initialize(cards)
        @cards = cards
        return @cards
    end

    def long_hand(card_list)
        @name_list = []
        @card_value = []
        @card_suite = []
        @temp = card_list.join("")
        @temp = @temp.split("")
        @temp.each do |v|
            case v.upcase
            when "2"
                @card_value << "Two"
            when "3"
                @card_value << "Three"
            when "4"
                @card_value << "Four"
            when "5"
                @card_value << "Five"
            when "6"
                @card_value << "Six"
            when "7"
                @card_value << "Seven"
            when "8"
                @card_value << "Eight"
            when "9"
                @card_value << "Nine"
            when "T"
                @card_value << "Ten"
            when "J"
                @card_value << "Jack"
            when "Q"
                @card_value << "Queen"
            when "K"
                @card_value << "King"
            when "A"
                @card_value << "Ace"
            when "S"
                @card_suite << "of Spades"
            when "Diamonds"
                @card_suite << "of Diamonds"
            when "Hearts"
                @card_suite << "of Hearts"
            when "Clubs"
                @card_suite << "of Clubs"
            end
        end
        card_list.each_with_index do |v,i|
            @name_list << "#{@card_value[i]} #{@card_suite[i]}"
        end
        return @name_list
    end

    attr_reader :cards
    attr_reader :name_list
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