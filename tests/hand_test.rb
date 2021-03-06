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
        temp.deal_in()
        assert_equal(["Player 1", "Player 2"], temp.players.keys)
    end

    def test_deal_player1_hand
        temp = Hands.new()
        temp.deal_in()
        temp.take_cards("Player 1", Cards.new(["8", "S"]))
        assert_equal("8 of Spades", temp.players["Player 1"][:hand][0].card_name)
    end

    def test_refactored_hash_hand
        temp = Hands.new()
        temp.deal_in()
        assert_equal({"Player 1" => {:hand => [], :type => "", :high_card => ""}, "Player 2" => {:hand => [], :type => "", :high_card => ""}}, temp.players)
    end

end