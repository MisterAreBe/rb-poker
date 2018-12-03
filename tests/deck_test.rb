require "minitest/autorun"
require_relative "../poker.rb"

class Deck < Minitest::Test

    def test_assert_that_1_equals_1
        assert_equal(1, 1)
    end

    def test_class_is_poker_deck
        temp = Poker_deck.new()
        assert_equal(Poker_deck, temp.class)
    end

    
end