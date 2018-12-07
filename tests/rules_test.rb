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
        temp.deck.hands.take_cards("Player 1", Cards.new(["2", "S"])) # The point of
        temp.deck.hands.take_cards("Player 1", Cards.new(["3", "S"])) # These 5 lines
        temp.deck.hands.take_cards("Player 1", Cards.new(["4", "S"])) # Are to test
        temp.deck.hands.take_cards("Player 1", Cards.new(["5", "S"])) # A certian hand
        temp.deck.hands.take_cards("Player 1", Cards.new(["6", "S"])) # Not a random one
        assert_equal("2 of Spades", temp.players["Player 1"][:hand][0].card_name)
    end
    
    def test_broken_down_hand
        temp = Game.new()
        temp.deck.hands.deal_in() # resets the players to blank
        temp.deck.hands.take_cards("Player 1", Cards.new(["2", "S"])) # The point of
        temp.deck.hands.take_cards("Player 1", Cards.new(["3", "S"])) # These 5 lines
        temp.deck.hands.take_cards("Player 1", Cards.new(["4", "S"])) # Are to test
        temp.deck.hands.take_cards("Player 1", Cards.new(["5", "S"])) # A certian hand
        temp.deck.hands.take_cards("Player 1", Cards.new(["6", "S"])) # Not a random one
        assert_equal([[2, 3, 4, 5, 6], ["Spades", "Spades", "Spades", "Spades", "Spades"]], temp.break_down(temp.players.keys[0]))
    end

    def test_finding_copies
        temp = Game.new()
        temp.deck.hands.deal_in() # resets the players to blank
        temp.deck.hands.take_cards("Player 1", Cards.new(["2", "S"])) # The point of
        temp.deck.hands.take_cards("Player 1", Cards.new(["3", "S"])) # These 5 lines
        temp.deck.hands.take_cards("Player 1", Cards.new(["2", "D"])) # Are to test
        temp.deck.hands.take_cards("Player 1", Cards.new(["5", "S"])) # A certian hand
        temp.deck.hands.take_cards("Player 1", Cards.new(["6", "S"])) # Not a random one
        temp.break_down(temp.players.keys[0])
        assert_equal(true, temp.copy_locator(2))
    end

    def test_finding_single_pair
        temp = Game.new()
        temp.deck.hands.deal_in() # resets the players to blank
        temp.deck.hands.take_cards("Player 1", Cards.new(["2", "S"])) # The point of
        temp.deck.hands.take_cards("Player 1", Cards.new(["3", "S"])) # These 5 lines
        temp.deck.hands.take_cards("Player 1", Cards.new(["2", "D"])) # Are to test
        temp.deck.hands.take_cards("Player 1", Cards.new(["5", "S"])) # A certian hand
        temp.deck.hands.take_cards("Player 1", Cards.new(["6", "S"])) # Not a random one
        temp.break_down(temp.players.keys[0])
        assert_equal(1, temp.single_pair())
    end

    def test_finding_3_of_a_kind
        temp = Game.new()
        temp.deck.hands.deal_in() # resets the players to blank
        temp.deck.hands.take_cards("Player 1", Cards.new(["2", "S"])) # The point of
        temp.deck.hands.take_cards("Player 1", Cards.new(["2", "Q"])) # These 5 lines
        temp.deck.hands.take_cards("Player 1", Cards.new(["2", "D"])) # Are to test
        temp.deck.hands.take_cards("Player 1", Cards.new(["5", "S"])) # A certian hand
        temp.deck.hands.take_cards("Player 1", Cards.new(["6", "S"])) # Not a random one
        temp.break_down(temp.players.keys[0])
        assert_equal(3, temp.three_match())
    end

    def test_finding_two_pair
        temp = Game.new()
        temp.deck.hands.deal_in() # resets the players to blank
        temp.deck.hands.take_cards("Player 1", Cards.new(["2", "S"])) # The point of
        temp.deck.hands.take_cards("Player 1", Cards.new(["2", "Q"])) # These 5 lines
        temp.deck.hands.take_cards("Player 1", Cards.new(["5", "D"])) # Are to test
        temp.deck.hands.take_cards("Player 1", Cards.new(["5", "S"])) # A certian hand
        temp.deck.hands.take_cards("Player 1", Cards.new(["6", "S"])) # Not a random one
        temp.break_down(temp.players.keys[0])
        assert_equal(2, temp.two_pair())
    end

    def test_straight
        temp = Game.new()
        temp.deck.hands.deal_in() # resets the players to blank
        temp.deck.hands.take_cards("Player 1", Cards.new(["2", "S"])) # The point of
        temp.deck.hands.take_cards("Player 1", Cards.new(["6", "Q"])) # These 5 lines
        temp.deck.hands.take_cards("Player 1", Cards.new(["3", "D"])) # Are to test
        temp.deck.hands.take_cards("Player 1", Cards.new(["5", "S"])) # A certian hand
        temp.deck.hands.take_cards("Player 1", Cards.new(["4", "S"])) # Not a random one
        temp.break_down(temp.players.keys[0])
        assert_equal(4, temp.straight())
    end

    def test_flush
        temp = Game.new()
        temp.deck.hands.deal_in() # resets the players to blank
        temp.deck.hands.take_cards("Player 1", Cards.new(["2", "S"])) # The point of
        temp.deck.hands.take_cards("Player 1", Cards.new(["Q", "s"])) # These 5 lines
        temp.deck.hands.take_cards("Player 1", Cards.new(["T", "s"])) # Are to test
        temp.deck.hands.take_cards("Player 1", Cards.new(["5", "S"])) # A certian hand
        temp.deck.hands.take_cards("Player 1", Cards.new(["4", "S"])) # Not a random one
        temp.break_down(temp.players.keys[0])
        assert_equal(5, temp.flush())
    end





    def test_finding_single_pair_type
        temp = Game.new()
        temp.deck.hands.deal_in() # resets the players to blank
        temp.deck.hands.take_cards("Player 1", Cards.new(["2", "S"])) # The point of
        temp.deck.hands.take_cards("Player 1", Cards.new(["3", "S"])) # These 5 lines
        temp.deck.hands.take_cards("Player 1", Cards.new(["2", "D"])) # Are to test
        temp.deck.hands.take_cards("Player 1", Cards.new(["5", "S"])) # A certian hand
        temp.deck.hands.take_cards("Player 1", Cards.new(["6", "S"])) # Not a random one
        temp.break_down(temp.players.keys[0])
        temp.single_pair(); temp.find_hand_type()
        assert_equal("Single Pair", temp.players["Player 1"][:type])
    end

end
