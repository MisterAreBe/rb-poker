require "minitest/autorun"
require_relative "../poker.rb"

class Poker < Minitest::Test

    def test_assert_that_1_equals_1
        assert_equal(1, 1)
    end

    def test_assert_deck_length
        deck = Deck.new.deck
        assert_equal(52, deck.length)
    end

    def test_shuffle_will_shuffle
        deck1 = Deck.new.deck
        deck2 = Deck.new.deck.shuffle
        refute_equal(deck1, deck2)
        p deck1; p deck2
    end



end