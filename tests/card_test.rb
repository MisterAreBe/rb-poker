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


 end