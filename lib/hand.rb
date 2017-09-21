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
    hand_get_ranks(hand1)
  end

  def hand_get_ranks(hand)
    ranks = []
    hand.each do |card|
      ranks.push card.rank
    end
    binding.pry
  end

  def face_convert(hand)
    hand_get_ranks(hand).map! do |rank|
      rank == :Jack || rank == :Queen || rank == :King ? 10 : rank
    end
  end

  def count_aces(hand)
    if hand_get_ranks(hand).count(:Ace) == 0
      score_non_aces(hand)
    elsif hand_get_ranks(hand).count(:Ace) >= 1
      ace_handler(hand)
      score_non_aces(hand.select { |card| card != :Ace})
      # serve an array to score_non_aces, which has filtered out the aces
    end
  end

  def ace_handler(hand)
    message = ""
    card_number = hand.length
    if count_aces(hand) == 0
      score_non_aces(hand)
    elsif count_aces(hand) == 1
      score_one_ace(hand)
    elsif count_aces(hand) == 2
      score_two_aces(hand)
    elsif count_aces(hand) == 3
      score_three_aces(hand)
    else count_aces(hand) == 4
      score_four_aces(hand)
    end
    print message
  end

  def score_one_ace(hand)
    card_number = hand.length
    total = 0
    if score_non_aces(hand) > 10
      total = score_non_aces(hand) + 1
    elsif score_non_aces(hand) <= 10
      total = score_non_aces(hand) + 11
    end
    print "Your point total with one Ace is " + total
  end

  # def score_one_ace(hand)
  #   card_number = hand.length
  #   total = 0
  #   # if card_number == 2
  #   #   total = score_non_aces(hand) + 11
  #   elsif card_number >= 3 && score_non_aces(hand) > 10
  #     total = score_non_aces(hand) + 1
  #   elsif card_number >= 3 && score_non_aces(hand) <= 10
  #     total = score_non_aces(hand) + 11
  #   end
  #   print "Your point total with one Ace is " + total
  # end

  def score_two_aces(hand)
    card_number = hand.length
    total = 0
    message = ""
    if card_number == 2
      message = "You have 2 Aces, with a soft score of 2 or 12"
      return message
    elsif card_number >= 3 && score_non_aces(hand) > 9
      total = score_non_aces(hand) + 2
      return "Your point total with two Aces is " + total
    elsif card_number >= 3 && score_non_aces(hand) <= 9
      total = score_non_aces(hand) + 12
      return "Your point total with two Aces is " + total
    end
  end

  def score_three_aces(hand)
    card_number = hand.length
    total = 0
    message = ""
    if card_number == 3
      message = "You have 3 Aces, with a soft score of 3 or 13"
      return message
    elsif card_number >= 4 && score_non_aces(hand) > 8
      total = score_non_aces(hand) + 3
      return "Your point total with three Aces is " + total
    elsif card_number >= 4 && score_non_aces(hand) <= 8
      total = score_non_aces(hand) + 13
      return "Your point total with three Aces is " + total
    end
  end

  def score_four_aces(hand)
    card_number = hand.length
    total = 0
    message = ""
    if card_number == 4
      message = "You have 4 Aces, with a soft score of 4 or 14"
      return message
    elsif card_number >= 5 && score_non_aces(hand) > 7
      total = score_non_aces(hand) + 3
      return "Your point total with four Aces is " + total
    elsif card_number >= 5 && score_non_aces(hand) <= 7
      total = score_non_aces(hand) + 13
      return "Your point total with four Aces is " + total
    end
  end

  def score_non_aces(hand)
    message = ""
    if any_ace?(hand) == true
      has_ace(hand)
    else
      message = "Your hand is worth #{face_convert(hand).sum} points."
    end
    message
  end

  def show_two_cards(hand)
    " a #{hand[0].rank} of #{hand[0].suit} and a #{hand[1].rank} of #{hand[1].suit}"
  end

  def show_one_card(hand)
    " a #{hand[0].rank} of #{hand[0].suit}"
  end

  def score_status(players_hand, dealers_hand)
    print "You have" + show_two_cards(players_hand) + ". " + "
    The dealer has one card face down is showing" + show_one_card(dealers_hand) + ".

    "
  end
end
