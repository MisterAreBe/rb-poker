require_relative "poker.rb"
class Hands
    def initialize()
        @players = Hash.new()
    end

    def deal_in(num_of_players=2)
        counter = 1
        while counter <= num_of_players
            @players["Player #{counter}"] = []
            counter += 1
        end
    end



    attr_reader :players
end