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
        deck2 = Deck.new.shuffle
        refute_equal(deck1, deck2)
        #p deck1; p deck2
    end

    def test_deal_hand
        deck = Deck.new.shuffle
        hand = Deck.new.deal(deck, 1)
        temp = hand.values
        assert_equal(5, temp[0].length)
        #p hand
    end

    def test_deal_2_hands
        deck = Deck.new.shuffle
        hands = Deck.new.deal(deck, 2)
        assert_equal(2, hands.length)
        #p hands
    end

    def test_score_class_returns_numbers
        var = Score.new(["2D"])
        assert_equal(Integer, var.class)
    end

    # def test_hand_values_are_integers
    #     deck = Deck.new.shuffle
    #     hands = Deck.new.deal(deck, 2)
    #     value = Score.new(hands.values)
    #     assert_equal(Integer, value.class)
    # end

end