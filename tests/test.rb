require "minitest/autorun"
require_relative "../poker.rb"

class Poker < Minitest::Test

    def test_assert_that_1_equals_1
        assert_equal(1, 1)
    end

    def test_assert_2H_equals_2_heart
        assert_equal("2H", deck(["2h"]))
    end

end