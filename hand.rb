require_relative "poker.rb"
class Hands
    def initialize()
        @players = Hash.new()
    end

    attr_reader :players
end