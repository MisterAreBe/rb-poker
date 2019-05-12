require "minitest/autorun"
require_relative "../deck.rb"

class Deck < Minitest::Test

    def test_assert_that_1_equals_1
        assert_equal(1, 1)
    end

    def test_class_is_poker_deck
        temp = Poker_deck.new()
        assert_equal(Poker_deck, temp.class)
    end

    def test_deck_is_array
        temp = Poker_deck.new()
        assert_equal(Array, temp.deck.class)
    end

    def test_deck_length_52
        temp = Poker_deck.new()
        assert_equal(52, temp.deck.length)
    end

    def test_deck_has_cards
        temp = Poker_deck.new()
        assert_equal(Cards, temp.deck[43].class)
    end

    def test_deck_is_shuffled
        temp = Poker_deck.new()
        temp2 = Poker_deck.new()
        refute_equal(temp.deck[26].card_name, temp2.deck[26].card_name)
        refute_equal(temp.deck[1].card_name, temp2.deck[1].card_name)
        refute_equal(temp.deck[51].card_name, temp2.deck[51].card_name)
    end

    def test_deal_cards_to_players
        temp = Poker_deck.new()
        temp.deal_out_cards()
        assert_equal(5, temp.hands.players["Player 1"][:hand].length)
        assert_equal(5, temp.hands.players["Player 2"][:hand].length)
    end





end