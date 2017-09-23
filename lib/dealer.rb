require_relative 'deck'
require_relative 'hands'
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

  def deal_one_card
    @shuffled_deck.pop(1)
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
