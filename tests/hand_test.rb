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

    def test_hands_has_hash
        temp = Hands.new()
        assert_equal(Hash, temp.players.class)
    end

    def test_hands_can_take_players
        temp = Hands.new()
        temp.deal_in(2)
        assert_equal(["Player 1", "Player 2"], temp.players.keys)
    end

end