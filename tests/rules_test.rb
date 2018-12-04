require "minitest/autorun"
require_relative "../poker.rb"

class PokerRules < Minitest::Test

    def test_assert_that_1_equals_1
        assert_equal(1, 1)
    end

    def test_game_class
        temp = Game.new()
        assert_equal(Game, temp.class)
    end

    def test_that_game_made_deck
        temp = Game.new()
        assert_equal(Poker_deck, temp.deck.class)
    end
    
    def test_that_game_dealt_hands
        temp = Game.new()
        assert_equal(5, temp.players["Player 1"][:hand].length)
        assert_equal(5, temp.players["Player 2"][:hand].length)
    end

    def test_hardcoded_hand_to_test
        temp = Game.new()
        temp.deck.hands.deal_in() # resets the players to blank
        temp.deck.hands.take_cards("Player 1", Cards.new(["2", "S"]))
        temp.deck.hands.take_cards("Player 1", Cards.new(["3", "S"]))
        temp.deck.hands.take_cards("Player 1", Cards.new(["4", "S"]))
        temp.deck.hands.take_cards("Player 1", Cards.new(["5", "S"]))
        temp.deck.hands.take_cards("Player 1", Cards.new(["6", "S"]))
        assert_equal("2 of Spades", temp.players["Player 1"][:hand][0].card_name)
    end

end
