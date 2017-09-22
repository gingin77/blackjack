require_relative 'dealer'
require_relative 'deck'
require_relative 'card'
require 'pry'

class Hand
  attr_reader :players_hand, :dealers_hand

  def initialize(hand1, hand2)
    @players_hand = hand1
    @dealers_hand = hand2
    score_status(@players_hand, @dealers_hand)
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

  def point_evalulator(hand)
    if convert_to_i_and_sum(hand) == 21
      "Congratulations, you have blackjack!"
    elsif convert_to_i_and_sum(hand) < 21
      "Your hand is worth #{ convert_to_i_and_sum(hand) } points."
    elsif convert_to_i_and_sum(hand) > 21
      # check_for_aces
      if hand_to_ranks(hand).count(aces) >= 1
        "Your hand is worth #{ convert_to_i_and_sum(hand) - 10 } points."
      else
        "Your hand is worth #{ convert_to_i_and_sum(hand) } points. You bust!"
      end
    end
  end

  def compare_player_to_dealer
    puts "compare_player_to_dealer method called"
    # point_evalulator(@players_hand)
    # binding.pry
  end

  # def count_aces(hand)
  #   if hand_get_ranks(hand).count(:Ace) == 0
  #     score_non_aces(hand)
  #   elsif hand_get_ranks(hand).count(:Ace) >= 1
  #     ace_handler(hand)
  #     score_non_aces(hand.select { |card| card != :Ace})
  #   end
  # end

  def show_two_cards(hand)
    " a #{hand[0].rank} of #{hand[0].suit} and a #{hand[1].rank} of #{hand[1].suit}"
  end

  def show_one_card(hand)
    " a #{hand[0].rank} of #{hand[0].suit}"
  end

  def score_status(players_hand, dealers_hand)
    print "You have" + show_two_cards(players_hand) + ". " + point_evalulator(players_hand) +
    "
    The dealer has one card face down is showing "  + show_one_card(dealers_hand) + ".

    "
  end

end
