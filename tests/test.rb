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
        assert_equal(10, card.card_value)
    end

    def test_card_returns_suit
        card = Card.new("2S")
        assert_equal("Spades", card.card_suit)
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
        assert_equal(4, hand.cards[0].card_value)
        assert_equal("Hearts", hand.cards[0].card_suit)
    end

    def test_2_players_deck_42_cards
        poker_deck = Deck.new
        poker_deck.shuffle()
        poker_deck.deal(2)
        # how many cards left in deck
        assert_equal(42, poker_deck.deck.length)
        # how many cards in one of the hands
        assert_equal(5, poker_deck.hand_list.values[1].cards.length)
        # how many hands are in the list
        assert_equal(2, poker_deck.hand_list.keys.length)
    end

    def test_straight_flush
        hand = Hand.new
        hand.add(Card.new("2H"))
        hand.add(Card.new("3H"))
        hand.add(Card.new("4H"))
        hand.add(Card.new("5H"))
        hand.add(Card.new("6H"))
        hash = {"player1" => hand}
        game = Hand_checker.new
        game.check(hash)
        assert_equal(["Player1 got, a Straight Flush!"], game.player_got)
    end

    def test_2_hands_got
        hand = Hand.new
        hand.add(Card.new("2H"))
        hand.add(Card.new("3H"))
        hand.add(Card.new("4H"))
        hand.add(Card.new("5H"))
        hand.add(Card.new("6H"))
        hand2 = Hand.new
        hand2.add(Card.new("7H"))
        hand2.add(Card.new("8H"))
        hand2.add(Card.new("9H"))
        hand2.add(Card.new("TH"))
        hand2.add(Card.new("JH"))
        hash = {"player1" => hand, "player2" => hand2}
        game = Hand_checker.new
        game.check(hash)
        assert_equal(["Player2 got, a Straight Flush!", "Player1 got, a Straight Flush!"], game.player_got)
        # but who won? Lets check the high card!
        assert_equal(["Player2's high card is Jack of Hearts", "Player1's high card is Six of Hearts"], game.high_card)
    end

    def test_4_of_a_kind
        hand = Hand.new
        hand.add(Card.new("AH"))
        hand.add(Card.new("AC"))
        hand.add(Card.new("AS"))
        hand.add(Card.new("AD"))
        hand.add(Card.new("5D"))
        hand2 = Hand.new
        hand2.add(Card.new("9D"))
        hand2.add(Card.new("KC"))
        hand2.add(Card.new("KS"))
        hand2.add(Card.new("KD"))
        hand2.add(Card.new("KH"))
        hash = {"player1" => hand, "player2" => hand2}
        game = Hand_checker.new
        game.check(hash)
        assert_equal("Player1 got, a Four of a Kind!", game.player_got[-1])
        assert_equal(["Player2 got, a Four of a Kind!", "Player1 got, a Four of a Kind!"], game.player_got)
        # But who won? Lets check the highest card!
        assert_equal(["Player2's high card is King of Clubs", "Player1's high card is Ace of Hearts"], game.high_card)
        # Aces are high btw, player1 wins :P
    end

    def test_full_house
        hand = Hand.new
        hand.add(Card.new("JS"))
        hand.add(Card.new("JC"))
        hand.add(Card.new("KH"))
        hand.add(Card.new("JD"))
        hand.add(Card.new("KD"))
        hand2 = Hand.new
        hand2.add(Card.new("3S"))
        hand2.add(Card.new("TC"))
        hand2.add(Card.new("3D"))
        hand2.add(Card.new("TS"))
        hand2.add(Card.new("TH"))
        hash = {"player1" => hand, "player2" => hand2}
        game = Hand_checker.new
        game.check(hash)
        assert_equal("Player1 got, a Full House!", game.player_got[-1])
        # This is where it's gonna get tricky
        assert_equal(["Player2 got, a Full House!", "Player1 got, a Full House!"], game.player_got)
        # But yet again, who won? Lets check the highest card!
        assert_equal(["Player2's high card is Ten of Clubs", "Player1's high card is Jack of Spades"], game.high_card)
    end

    def test_flush
        hand = Hand.new
        hand.add(Card.new("8S"))
        hand.add(Card.new("JS"))
        hand.add(Card.new("QS"))
        hand.add(Card.new("2S"))
        hand.add(Card.new("4S"))
        hand2 = Hand.new
        hand2.add(Card.new("TH"))
        hand2.add(Card.new("4H"))
        hand2.add(Card.new("7H"))
        hand2.add(Card.new("3H"))
        hand2.add(Card.new("AH"))
        hash = {"player1" => hand, "player12" => hand2}
        game = Hand_checker.new
        game.check(hash)
        assert_equal("Player1 got, a Flush!", game.player_got[-1])
        assert_equal(["Player2 got, a Flush!", "Player1 got, a Flush!"], game.player_got)
        # But yet again, who won? Lets check the highest card!
        assert_equal(["Player2's high card is Ace of Hearts", "Player1's high card is Queen of Spades"], game.high_card)
    end

    def test_straight
        hand = Hand.new
        hand.add(Card.new("AS"))
        hand.add(Card.new("KC"))
        hand.add(Card.new("QD"))
        hand.add(Card.new("JH"))
        hand.add(Card.new("TC"))
        hand2 = Hand.new
        hand2.add(Card.new("KD"))
        hand2.add(Card.new("QH"))
        hand2.add(Card.new("JC"))
        hand2.add(Card.new("TH"))
        hand2.add(Card.new("9S"))
        hash = {"player1" => hand, "player12" => hand2}
        game = Hand_checker.new
        game.check(hash)
        assert_equal("Player1 got, a Straight!", game.player_got[-1])
        assert_equal(["Player2 got, a Straight!", "Player1 got, a Straight!"], game.player_got)
        # So yet again, let's chekc the high card....
        assert_equal(["Player2's high card is King of Diamonds", "Player1's high card is Ace of Spades"], game.high_card)
    end

    def test_three_of_a_kind
        hand = Hand.new
        hand.add(Card.new("3S"))
        hand.add(Card.new("3C"))
        hand.add(Card.new("3D"))
        hand.add(Card.new("JH"))
        hand.add(Card.new("TC"))
        hand2 = Hand.new
        hand2.add(Card.new("2D"))
        hand2.add(Card.new("2H"))
        hand2.add(Card.new("2C"))
        hand2.add(Card.new("TH"))
        hand2.add(Card.new("9S"))
        hash = {"player1" => hand, "player12" => hand2}
        game = Hand_checker.new
        game.check(hash)
        assert_equal("Player1 got, a Three of a Kind!", game.player_got[-1])
        assert_equal(["Player2 got, a Three of a Kind!", "Player1 got, a Three of a Kind!"], game.player_got)
        assert_equal(["Player2's high card is Two of Diamonds", "Player1's high card is Three of Spades"], game.high_card)
    end

    def test_two_pairs
        hand = Hand.new
        hand.add(Card.new("3S"))
        hand.add(Card.new("3C"))
        hand.add(Card.new("5D"))
        hand.add(Card.new("5H"))
        hand.add(Card.new("TC"))
        hand2 = Hand.new
        hand2.add(Card.new("2D"))
        hand2.add(Card.new("2H"))
        hand2.add(Card.new("8C"))
        hand2.add(Card.new("8H"))
        hand2.add(Card.new("9S"))
        hash = {"player1" => hand, "player12" => hand2}
        game = Hand_checker.new
        game.check(hash)
        assert_equal("Player1 got, a Two Pairs!", game.player_got[-1])
        assert_equal(["Player2 got, a Two Pairs!", "Player1 got, a Two Pairs!"], game.player_got)
        assert_equal(["Player2's high card is Eight of Clubs", "Player1's high card is Five of Diamonds"], game.high_card)
    end

 end