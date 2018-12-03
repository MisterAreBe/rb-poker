require "minitest/autorun"
require_relative "../card.rb"

class Card < Minitest::Test

    def test_assert_that_1_equals_1
        assert_equal(1, 1)
    end

    def test_card_class
        temp = Cards.new([])
        assert_equal(Cards, temp.class)
    end

 end