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

  def score(hand)
    message = ""
    if any_ace?(hand) == true
      has_ace(hand)
    else
      message = "Your hand is worth #{face_convert(hand).sum} points."
    end
    message
  end

  def has_ace(hand)
    message = ""
    if handle_ace(hand).count(true) == 1
      message = "You have a soft hand, with an Ace that is worth 11 or 1."
    else
      message = "You have 2 Aces, with a soft score of 12"
    end
    message
  end

  def handle_ace(hand)
    hand_get_ranks(hand).map! do |rank|
      rank == :Ace ? true : false
    end
  end

  def any_ace?(hand)
    handle_ace(hand).any?
  end

  def hand_get_ranks(hand)
    ranks = []
    ranks.push(hand[0].rank, hand[1].rank)
  end

  def face_convert(hand)
    # converted = hand_get_ranks(hand)
    hand_get_ranks(hand).map! do |rank|
      rank == :Jack || rank == :Queen || rank == :King ? 10 : rank
    end
  end

  def show_two_cards(hand)
    " a #{hand[0].rank} of #{hand[0].suit} and a #{hand[1].rank} of #{hand[1].suit}"
  end

  def show_one_card(hand)
    " a #{hand[0].rank} of #{hand[0].suit}"
  end

  # def ace_handler
  #   if hand[0].rank != :Ace && hand[1].rank != :Ace
  # end

  def score_status(players_hand, dealers_hand)
    print "You have" + show_two_cards(players_hand) + ". " + score(players_hand) + "
    The dealer has one card face down is showing" + show_one_card(dealers_hand) + ".

    "
  end
end
