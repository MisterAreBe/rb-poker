class Cards
    def initialize(card)
        face = {"T" => 10, "J" => 11, "Q" => 12, "K" => 13, "A" => 14}
        suit = {"S" => "Spades", "C" => "Clubs", "D" => "Diamonds", "H" => "Hearts"}
        face.each_pair do |key, value|
            unless card[0].is_a?(Integer) && card[0] == key
                @card_value = value
            end
            @card_value = card[0].to_i
        end
    end
    attr_reader :card_value
end