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

    def deal(deck, players)
        @hands = Hash.new
        @cards_per_hand = 5
        while players > 0
            @hands["player#{players}"] = []
            players -= 1
        end
        @temp = @hands.values
        @cards_per_hand.times do
            @hands.each do |key, value|
                value << deck[0]
                @hands[key] = value
                deck.delete_at(0)
            end
        end
        @hands
    end

    attr_accessor :cards_per_hand
    attr_reader :hands
    attr_reader :deck
end