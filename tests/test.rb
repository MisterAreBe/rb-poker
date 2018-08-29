require "minitest/autorun"
require_relative "../poker.rb"

class Poker < Minitest::Test

    def test_assert_that_1_equals_1
        assert_equal(1, 1)
    end

    def test_assert_2H_equals_2_heart
        assert_equal(["2H"], deck(["2h"]))
    end

    def test_assert_7H_equals_7_heart
        assert_equal(["7H"], deck(["7h"]))
    end

    def test_assert_R_equals_random
        assert_equal("random", deck("r"))
    end

    def test_fail_for_dupe_cards
        assert_equal(false, deck(["ah", "ad", "ah"]))
    end

    def test_fail_for_more_then_5_cards
        assert_equal(false, deck(["ks", "qd", "5c", "9h", "as", "7d"]))
    end

    def test_assert_invalid_card_fails
        assert_equal(false, deck(["89p"]))
    end

    def test_assert_other_invalid_cards_fail
        assert_equal(false, deck(["2w"]))
    end
end