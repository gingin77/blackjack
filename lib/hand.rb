require_relative 'dealer'
require_relative 'deck'
require_relative 'card'
require 'pry'

class Hand
  attr_reader :players_hand, :dealers_hand

  def initialize(hand1, hand2)
    @players_hand = hand1
    @dealers_hand = hand2
    concatenate(@players_hand, @dealers_hand)
    print face_convert(@players_hand)
  end

  def show_two_cards(hand)
    " a #{hand[0].rank} of #{hand[0].suit} and a #{hand[1].rank} of #{hand[1].suit}"
  end

  def show_one_card(hand)
    " a #{hand[0].rank} of #{hand[0].suit}"
  end

# hand.map { |rank, suit| (rank == :Jack || rank == :Queen || rank == :King) ? "10" }
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

  def handle_ace(hand)
    hand_get_ranks(hand).map! do |rank|
      rank == :Jack ? true : false
    end
  end


  # def ace_handler
  #   if hand[0].rank != :Ace && hand[1].rank != :Ace
  # end

  def concatenate(players_hand, dealers_hand)
    print "You have" + show_two_cards(players_hand) + ". The dealer has one card face down is showing" + show_one_card(dealers_hand) + ".

    "
  end
end
