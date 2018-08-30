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

    def deal(deck)
        @hand = []
        @counter = 0
        5.times do
            @hand << deck[@counter]
            @counter += 1
        end
        @hand
    end

    attr_reader :hand
    attr_reader :deck
end