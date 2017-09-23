require_relative 'deck'
require_relative 'hand'
require 'pry'

class Dealer
  attr_accessor :shuffled_deck
  # , :two_to_player, :two_to_dealer

  def initialize
    @shuffled_deck = Deck.new.create_deck
    # @two_to_player = deal_two_cards
    # @two_to_dealer = deal_two_cards
  end

  def deal_two_cards
    @shuffled_deck.pop(2)
  end

  def deal_one_card_to_player
    # binding.pry
    # puts "the deal_one_card method was called"
    @shuffled_deck.pop(1)
    # Hand.new(hand_array, @two_to_dealer)
    # the new card is added to the end of the array
    # binding.pry
  end

  # def puts_hands
  #   puts @shuffled_deck[-2..51]
  #   puts "^^ shuffled_deck"
  #   puts @players_hand
  #   puts "/n ^^players_hand"
  #   puts @dealers_hand
  #   puts "/n ^^dealers_hand"
  # end
end
