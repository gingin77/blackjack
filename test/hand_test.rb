require "minitest/autorun"
require_relative "../lib/hand.rb"

class HandTest < Minitest::Test
  def setup
    @one_ace = [Card.new(:Ace, :clubs), Card.new(:King, :clubs)]
    @two_faces_one_ace = [Card.new(:Ace, :clubs), Card.new(:Jack, :diamonds), Card.new(:Queen, :clubs)]
    @one_face_one_ace_nine = [Card.new(:Ace, :clubs), Card.new(:Jack, :diamonds), Card.new(9, :clubs)]

    @hand = Hand.new(@one_face_one_ace_nine, @one_ace)
  end

  def test_that_ace_equals_eleven
    skip
    # assert convert_to_i_and_sum( @hand[0] ) == 21
  end
  #
  # def test_that_ace_equals_one
  #   skip
  #   assert convert_to_i_and_sum(@two_faces_one_ace) == 21
  # end
end
