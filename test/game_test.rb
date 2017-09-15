require "minitest/autorun"
require_relative "../lib/game"

class GameTest < Minitest::Test
  def game_setup
    ng = Game.new
    @player = Player.new
  end

  def test_start_display
    expected_output = <<EOF
    Hello and welcome to the game of blackjack! Let's begin.

    You have $100 and bet $10.
    You have a 9 and a 8 in your hand. Your total is 15.
    Do you want to (h)it or (s)tand?
EOF

  ng = Game.new ??????
  assert_output expected_output do
    ng.start_display
  end





end
