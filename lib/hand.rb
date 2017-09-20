require_relative 'dealer'
require_relative 'deck'
require_relative 'card'
require 'pry'

class Hand
  attr_reader :players_hand, :dealers_hand

  def initialize(hand1, hand2)
    @players_hand = first_hand(hand1, 1)
    @dealers_hand = first_hand(hand2, 2)
  end

  def first_hand(hand, num)
    r1 = hand[0].rank
    s1 = hand[0].suit
    r2 = hand[1].rank
    s2 = hand[1].suit
    message(r1,s1,r2,s2,num)
  end

  def message(r1,s1,r2,s2, num)
    if num == 1
        players_string = "You have a #{r1} of #{s1} and a #{r2} of #{s2}. "
        puts players_string
      if num == 2
        dealers_string = "The dealer is showing a #{r1} of #{s1} and a 2nd card facing down. "
        puts dealers_string
      end
    end
  end
end
