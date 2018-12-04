require "minitest/autorun"
require_relative "../poker.rb"

class PokerRules < Minitest::Test

    def test_assert_that_1_equals_1
        assert_equal(1, 1)
    end

    def test_game_class
        temp = Game.new()
        assert_equal(Game, temp.class)
    end

    def test_that_game_made_deck
        temp = Game.new()
        assert_equal(Deck, temp.deck.class)
    end
    
end
