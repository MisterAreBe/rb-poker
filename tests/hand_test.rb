require "minitest/autorun"
require_relative "../hand.rb"

class Hand < Minitest::Test

    def test_assert_that_1_equals_1
        assert_equal(1, 1)
    end

    def test_hands_class
        temp = Hands.new()
        assert_equal(Hands, temp.class)
    end

    
end