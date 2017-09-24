require_relative 'game'
require_relative 'dealer'
require_relative 'deck'
require_relative 'card'
require_relative 'player'
require 'pry'

class Hands
  attr_reader :players_hand, :dealers_hand, :hand_wins, :tie

  def initialize(dealer)
    @players_hand = dealer.deal_two_cards
    @dealers_hand = dealer.deal_two_cards
    @hand_wins = false
    @tie = false
    # score_status(@players_hand, @dealers_hand)
  end

  def player_accepts_new_card(card)
    @players_hand = @players_hand + card
  end

  def hand_to_ranks(hand)
    # binding.pry
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
      "Congratulations, you have blackjack!\n"
    elsif convert_to_i_and_sum(hand) < 21
      "Your hand is worth #{ convert_to_i_and_sum(hand) } points.\n"
    elsif convert_to_i_and_sum(hand) > 21
      if hand_to_ranks(hand).count(:Ace) >= 1
        "Your hand is worth #{ convert_to_i_and_sum(hand) - 10 } points.\n"
      else
        "Your hand is worth #{ convert_to_i_and_sum(hand) } points. You bust!\n"
      end
    end
  end

  def compare_player_to_dealer
    if point_evalulator_to_i(@players_hand) > 21
      "You loose $10 on this hand.\n"
    elsif point_evalulator_to_i(@players_hand) == 21
      "Congratulations, you win $10 on this hand!\n"
    elsif point_evalulator_to_i(@players_hand) < 21 && point_evalulator_to_i(@dealers_hand) > 21
      "The dealer busted, so you win $10 on this hand!\n"
    elsif point_evalulator_to_i(@players_hand) < 21 && point_evalulator_to_i(@dealers_hand) < 21
      if point_evalulator_to_i(@players_hand) > point_evalulator_to_i(@dealers_hand)
      "Your hand beat the dealer's hand, so you win $10 on this hand!\n"
      elsif point_evalulator_to_i(@players_hand) == point_evalulator_to_i(@dealers_hand)
      "You tied the dealer. No money gained or lost.\n"
      elsif point_evalulator_to_i(@players_hand) < point_evalulator_to_i(@dealers_hand)
      "Your hand lost to the dealer. You loose $10 on this hand.\n"
      end
    elsif point_evalulator_to_i(@players_hand) < 21 && point_evalulator_to_i(@dealers_hand) == 21
      "The dealer had blackjack. You loose $10 on this hand.\n"
    end
  end

  def bets_handler
    if point_evalulator_to_i(@players_hand) > 21
      @hand_wins = false
    elsif point_evalulator_to_i(@players_hand) == 21
      @hand_wins = true
    elsif point_evalulator_to_i(@players_hand) < 21 && point_evalulator_to_i(@dealers_hand) > 21
      @hand_wins = true
    elsif point_evalulator_to_i(@players_hand) < 21 && point_evalulator_to_i(@dealers_hand) < 21
      if point_evalulator_to_i(@players_hand) > point_evalulator_to_i(@dealers_hand)
        @hand_wins = true
      elsif point_evalulator_to_i(@players_hand) == point_evalulator_to_i(@dealers_hand)
        @tie = true
      elsif point_evalulator_to_i(@players_hand) < point_evalulator_to_i(@dealers_hand)
        @hand_wins = false
      end
    elsif point_evalulator_to_i(@players_hand) < 21 && point_evalulator_to_i(@dealers_hand) == 21
      @hand_wins = false
    end
  end

  def score_status(players_hand, dealers_hand)
    # binding.pry
    if players_hand.length == 2 && blackjack?(players_hand) == false
      print "\n#{ show_two_cards(@players_hand)}" + point_evalulator(players_hand) + "\n"
      print "The dealer has one card face down and is showing" + show_one_card(dealers_hand) + ".\n"
    elsif players_hand.length > 2 && blackjack?(players_hand) == false
      print "\n#{ show_more_than_two_cards(@players_hand) }" + point_evalulator(players_hand)
    end
  end

  def show_two_cards(hand)
    display = []
    hand.each do |card|
      display.push " a " + card.rank.to_s + " of " + card.suit.to_s
    end
    "You have#{display[0]} and#{display[1]}. "
  end

  def show_more_than_two_cards(hand)
    # binding.pry
    display = []
    hand.each do |card|
      display.push " a " + card.rank.to_s + " of " + card.suit.to_s
    end
    if display.length == 3
    "You now have: #{display[0]}, #{display[1]}, and #{display[2]}. "
    elsif display.length == 4
    "You now have: #{display[0]}, #{display[1]}, #{display[2]}, and#{display[3]}."
    elsif display.length == 5
    "You now have: #{display[0]}, #{display[1]}, #{display[2]}, #{display[3]}, and#{display[4]}."
      #   end
      # end
    end
  end

  def show_one_card(hand)
    " a #{hand[0].rank} of #{hand[0].suit}"
  end
end
