require "minitest/autorun"
require_relative "../lib/game"

class GameTest < Minitest::Test
  # def game_setup
  #   # skip
  #   @ng = Game.new
  #   @blackjack_hand = [Card.new(:Ace, :clubs), Card.new(:King, :clubs)]
  #   @two_nums = [Card.new(8, :clubs), Card.new(9, :clubs)]
  # end
  #
  # def test_start_display
  #   skip
  #   # assert_equal @ng.start_new_game( @one_ace ), 21
  #   # incomplete
  # end
end

# Refer to commit from Friday, Sept 22nd
#     expected_output = <<EOF
#     Hello and welcome to the game of blackjack!
#
#     Let's begin. You have $100 and you have to bet $10 on each hand.
#
#     Aces are worth 1 or 11 and will be evaluated in your favor.
#
# EOF
# stack_trace method: game_test.rb:13: warning: assigned but unused variable - expected_output
