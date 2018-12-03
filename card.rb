require_relative "poker.rb"
class Cards
    def initialize(card)
        @suit = {"S" => "Spades", "C" => "Clubs", "D" => "Diamonds", "H" => "Hearts"}
        @card = card
        @card_value = get_value()
        @card_suit = @suit[card[1]]
        @card_name = "#{get_name} of #{@card_suit}"
    end

    def get_value()
        face = {"T" => 10, "J" => 11, "Q" => 12, "K" => 13, "A" => 14}
        face.has_key?(@card[0]) ? face[@card[0]] : @card[0].to_i
    end

    def get_name()
        face_name = {"T" => "Ten", "J" => "Jack", "Q" => "Queen", "K" => "King", "A" => "Ace"}
        face_name.has_key?(@card[0]) ? face_name[@card[0]] : @card[0]
    end

    attr_reader :card_name
    attr_reader :card_suit
    attr_reader :card_value
end