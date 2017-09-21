require "minitest/autorun"
require_relative "../lib/hand"

class HandTest < Minitest::Test
  def test_that_ace_equals_eleven
    # skip

    one_ace = [Card.new(:Ace, :clubs), Card.new(:King, :clubs)]

    assert score_one_ace(one_ace) == 21
  end

  def test_that_ace_equals_one
    # skip

    two_faces_one_ace = [Card.new(:Ace, :clubs), Card.new(:Jack, :diamonds), Card.new(:Queen, :clubs)]

    assert score_one_ace(two_faces_one_ace) == 21
  end
end
