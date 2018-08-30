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
        hand = deck.deal(1)
        temp = hand.values
        assert_equal(5, temp[0].length)
        #p hand
    end

    def test_deal_2_hands
        deck = Deck.new
        #p "this is deck #{deck}"
        deck.shuffle()
        #p "this is deck after shuffle #{deck}"
        hands = deck.deal(2)
        #p "this is deck after deal #{deck}"
        #p "this is hands #{hands}"
        assert_equal(2, hands.length)
        #p hands
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


 end