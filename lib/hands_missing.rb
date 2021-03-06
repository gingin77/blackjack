require_relative 'game'
require_relative 'dealer'
require_relative 'deck'
require_relative 'card'
require_relative 'player'
require 'pry'

class Hands
  attr_reader :players_hand, :dealers_hand

  def initialize(dealer)
    @players_hand = dealer.deal_two_cards
    @dealers_hand = dealer.deal_two_cards
    # score_status(@players_hand, @dealers_hand)
  end

  def player_accepts_new_card(card)
    @players_hand = @players_hand + card
  end

  def hand_to_ranks(hand)
    ranks = []
    hand.each do |card|
      ranks.push card.rank
    end
    ranks
  end

  def convert_to_i_and_sum(hand)
    new_array = []
    new_array = hand_to_ranks(hand).map! do |rank|
      (rank == :Jack || rank == :Queen || rank == :King) ? 10 : rank
    end
    new_array = new_array.map! do |rank|
      (rank == :Ace) ? 11 : rank
    end
    new_array.sum
  end

  def point_evalulator_to_i(hand)
    if convert_to_i_and_sum(hand) == 21
      21
    elsif convert_to_i_and_sum(hand) < 21
      convert_to_i_and_sum(hand)
    elsif convert_to_i_and_sum(hand) > 21
      if hand_to_ranks(hand).count(:Ace) >= 1
        convert_to_i_and_sum(hand) - 10
      else
        convert_to_i_and_sum(hand)
      end
    end
  end

  def blackjack?(players_hand)
    convert_to_i_and_sum(players_hand) == 21? true : false
  end

  def under_21(players_hand)
    convert_to_i_and_sum(players_hand) < 21? true : false
  end

  def point_evalulator(hand)
    if convert_to_i_and_sum(hand) == 21
      "Congratulations, you have blackjack!"
      # return false
    elsif convert_to_i_and_sum(hand) < 21
      "Your hand is worth #{ convert_to_i_and_sum(hand) } points."
    elsif convert_to_i_and_sum(hand) > 21
      # check_for_aces
      if hand_to_ranks(hand).count(:Ace) >= 1
        "Your hand is worth #{ convert_to_i_and_sum(hand) - 10 } points."
      else
        "Your hand is worth #{ convert_to_i_and_sum(hand) } points. You bust!"
      end
    end
  end

  def compare_player_to_dealer
    if point_evalulator_to_i(@players_hand) > 21
      "You lose $10 on this hand.
      "
      # In the Game class >> player.lose_bet
    elsif point_evalulator_to_i(@players_hand) == 21
      "Congratulations, you win $10 on this hand!
      "
    elsif point_evalulator_to_i(@players_hand) < 21 && point_evalulator_to_i(@dealers_hand) > 21
      "You win $10 on this hand.
      "
    elsif point_evalulator_to_i(@players_hand) < 21 && point_evalulator_to_i(@dealers_hand) < 21
      if point_evalulator_to_i(@players_hand) > point_evalulator_to_i(@dealers_hand)
      "Your hand beat the dealer's hand, so you win $10 on this hand!
      "
      elsif point_evalulator_to_i(@players_hand) == point_evalulator_to_i(@dealers_hand)
        "You tied the dealer. No money gained or lost.
        "
      elsif point_evalulator_to_i(@players_hand) < point_evalulator_to_i(@dealers_hand)
        "Your hand lost to the dealer. You lose $10 on this hand.
        "
      end
    elsif point_evalulator_to_i(@players_hand) < 21 && point_evalulator_to_i(@dealers_hand) == 21
      "The dealer had blackjack. You lose $10 on this hand.
      "
    end
  end

  def score_status(players_hand, dealers_hand)
    # binding.pry
    if players_hand.length == 2 && blackjack?(players_hand) == false
    print "
    You have" + show_two_cards(players_hand) + ". " + point_evalulator(players_hand) +
    "
    The dealer has one card face down and is showing "  + show_one_card(dealers_hand) + ".

    "
    elsif players_hand.length > 2 && blackjack?(players_hand) == false
    print "
    You now have" + show_three_cards(players_hand) + ". " + point_evalulator(players_hand) +     "

    "
    end
  end

  def show_three_cards(hand)
    " a #{hand[0].rank} of #{hand[0].suit}, a #{hand[1].rank} of #{hand[1].suit}, and a #{hand[2].rank} of #{hand[2].suit}"
  end

  def show_two_cards(hand)
    " a #{hand[0].rank} of #{hand[0].suit} and a #{hand[1].rank} of #{hand[1].suit}"
  end

  def show_one_card(hand)
    " a #{hand[0].rank} of #{hand[0].suit}"
  end
end
