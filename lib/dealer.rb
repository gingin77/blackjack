require_relative 'deck'
require 'pry'

class Dealer
  attr_reader :shuffled_deck, :two_to_player, :two_to_dealer

  def initialize
    @shuffled_deck = Deck.new.create_deck
    @two_to_player = deal_two_cards
    @two_to_dealer = deal_two_cards
  end

  def deal_two_cards
    @shuffled_deck.pop(2)
  end

  # def deals?
  #   # If player.response == true, deal_one_card
  #   # # If dealers_hand > ?? (set criteria), deal_one_card
  # end

  def deal_one_card_to_player
    # puts "the deal_one_card method was called"
    hand_array = @two_to_player + @shuffled_deck.pop(1)
    new_card_hand = Hand.new(hand_array, @two_to_dealer)
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
