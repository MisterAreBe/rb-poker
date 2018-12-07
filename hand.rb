require_relative "card.rb"
class Hands
    def initialize()
        @players = Hash.new()
    end

    def deal_in(num_of_players=2)
        counter = 1
        while counter <= num_of_players
            @players["Player #{counter}"] = {:hand => [], :type => "", :high_card => "", :score => [0,[0,0,0,0,0]]}
            counter += 1
        end
    end

    def take_cards(player, card)
        @players[player][:hand] << card
    end


    attr_reader :players
end