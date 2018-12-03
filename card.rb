class Cards
    def initialize(card)
        @face = {"T" => 10, "J" => 11, "Q" => 12, "K" => 13, "A" => 14}
        @suit = {"S" => "Spades", "C" => "Clubs", "D" => "Diamonds", "H" => "Hearts"}
        @card = card
        @card_value = get_value()
        @card_suit = @suit[card[1]]
    end

    def get_value()
        @face.has_key?(@card[0]) ? @face[@card[0]] : @card[0].to_i
    end

    attr_reader :card_suit
    attr_reader :card_value
end