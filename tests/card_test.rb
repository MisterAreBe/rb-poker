require "minitest/autorun"
require_relative "../card.rb"

class Card < Minitest::Test

    def test_assert_that_1_equals_1
        assert_equal(1, 1)
    end

    def test_cards_class
        temp = Cards.new(['', ''])
        assert_equal(Cards, temp.class)
    end

    def test_card_value
        temp = Cards.new(['5', 'D'])
        assert_equal(5, temp.card_value)
        temp2 = Cards.new(['T', 'D'])
        assert_equal(10, temp2.card_value)
    end

    def test_card_suit
        temp = Cards.new(['9', 'H'])
        assert_equal('Hearts', temp.card_suit)
    end

    def test_card_name
        temp = Cards.new(['A', 'C'])
        assert_equal("Ace of Clubs", temp.card_name)
    end
 end