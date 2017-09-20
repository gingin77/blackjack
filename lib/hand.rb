require_relative 'dealer'
require_relative 'deck'
require_relative 'card'

class Hand
  attr_reader :players_hand, :dealers_hand

  def initialize(players_hand, dealers_hand)
    @players_hand = players_first_hand(players_hand)
    @dealers_hand = dealers_first_hand(dealers_hand)
  end

  def players_first_hand(hand)
    rank1 = hand[0].rank
    suit1 = hand[0].suit
    rank2 = hand[1].rank
    suit2 = hand[1].suit
    print "You have a #{rank1} of #{suit2} and a #{rank2} of #{suit2}.

    "
  end

  def dealers_first_hand(hand)
    rank1 = hand[0].rank
    suit1 = hand[0].suit
    rank2 = hand[1].rank
    suit2 = hand[1].suit
    print "The dealer has a #{rank1} of #{suit2} and a #{rank2} of #{suit2}.

    "
  end
end
