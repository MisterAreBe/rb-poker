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
        @card = cards[0] 
    end
    attr_reader :card
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