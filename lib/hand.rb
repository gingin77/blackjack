require_relative 'dealer'
require_relative 'deck'
require_relative 'card'

# [#<struct Card rank=4, suit=:clubs>, #<struct Card rank=:J, suit=:spades>]
#
# [4] pry(#<Dealer>)> @dealers_hand[0].to_s
# => "#<struct Card rank=4, suit=:clubs>"
# [5] pry(#<Dealer>)> @dealers_hand[0].class
# => Card
# [6] pry(#<Dealer>)> @dealers_hand[0].rank
# => 4
# [7] pry(#<Dealer>)> @dealers_hand[0].suit
# => :clubs


class Hand
  def initialize(players_hand)
    @players_hand = players_first_hand(players_hand)
    # @dealers_hand = dealers_hand
  end

  def players_first_hand(hand)
    rank1 = hand[0].rank
    suit1 = hand[0].suit
    rank2 = hand[1].rank
    suit2 = hand[1].suit
    print "You have a #{rank1} of #{suit2} and a #{rank2} of #{suit2}. "
  end
end
