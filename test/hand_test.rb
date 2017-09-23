require "minitest/autorun"
require_relative "../lib/hand.rb"

class HandTest < Minitest::Test
  def setup
    @blackjack_hand = [Card.new(:Ace, :clubs), Card.new(:King, :clubs)]

    @two_faces_one_ace = [Card.new(:Ace, :clubs), Card.new(:Jack, :diamonds), Card.new(:Queen, :clubs)]

    @one_ace_one_three_one_face = [Card.new(:Ace, :clubs), Card.new(3, :clubs), Card.new(:Jack, :diamonds)]

    @one_face_one_ace_nine = [Card.new(:Ace, :clubs), Card.new(:Jack, :diamonds), Card.new(9, :clubs)]

    @one_jack_one_three_one_jack = [Card.new(:Jack, :clubs), Card.new(3, :clubs), Card.new(:Jack, :diamonds)]

    @two_faces = [Card.new(8, :clubs), Card.new(9, :clubs)]

    @hand = Hand.new(@one_face_one_ace_nine, @blackjack_hand)
  end

  def test_that_ace_equals_eleven
    # skip
    assert_equal @hand.convert_to_i_and_sum( @blackjack_hand ), 21
  end

  def test_ace_to_one
    # skip
    assert_equal @hand.point_evalulator( @one_ace_one_three_one_face ), "Your hand is worth 14 points."
  end

  def test_bust
    # skip
    assert_equal @hand.point_evalulator( @one_jack_one_three_one_jack ), "Your hand is worth 23 points. You bust!"
  end

  def test_not_a_bust
    # skip
    assert_equal @hand.point_evalulator( @blackjack_hand ), "Congratulations, you have blackjack!"
    assert_equal @hand.point_evalulator( @one_face_one_ace_nine ), "Your hand is worth 20 points."
  end
end
