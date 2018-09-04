require "minitest/autorun"
require_relative "../poker.rb"

class Poker < Minitest::Test

    def test_assert_that_1_equals_1
        assert_equal(1, 1)
    end

    def test_assert_deck_length
        deck = Deck.new.deck
        assert_equal(52, deck.length)
    end

    def test_shuffle_will_shuffle
        deck1 = Deck.new.deck
        deck2 = Deck.new.shuffle
        refute_equal(deck1, deck2)
        #p deck1; p deck2
    end
    
    def test_deal_hand
        deck = Deck.new
        deck.shuffle()
        deck.deal(1)
        assert_equal(5, deck.hand_list.values[0].cards.length)
    end

    def test_deal_2_hands
        deck = Deck.new
        deck.shuffle()
        deck.deal(2)
        assert_equal(2, deck.hand_list.keys.length)
    end

    def test_card_returns_name
        single_card = Card.new("7H")
        assert_equal("7H", single_card.card)
    end

    def test_card_long_hand
        card = Card.new("AS")
        assert_equal("Ace of Spades", card.card_longhand)
    end

    def test_card_returns_value
        card = Card.new("TC")
        assert_equal("10", card.card_value)
    end

    def test_card_returns_suite
        card = Card.new("2S")
        assert_equal("Spades", card.card_suite)
    end

    def test_hand_is_hand_class
        hand = Hand.new
        assert_equal(Hand, hand.class)
    end

    def test_cards_is_array_class
        hand = Hand.new
        assert_equal(Array, hand.cards.class)
    end

    def test_add_card_to_hand
        hand = Hand.new
        card = Card.new("JD")
        hand.add(card)
        assert_equal(card, hand.cards[0])
    end

    def test_add_cards_to_hand    
        hand = Hand.new
        card = Card.new("4H")
        hand.add(card)
        assert_equal("Four of Hearts", hand.cards[0].card_longhand)
        assert_equal("4", hand.cards[0].card_value)
        assert_equal("Hearts", hand.cards[0].card_suite)
    end

    def test_2_players_deck_42_cards
        poker_deck = Deck.new
        poker_deck.shuffle()
        poker_deck.deal(2)
        assert_equal(42, poker_deck.deck.length)
    end

 end