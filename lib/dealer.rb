require_relative 'deck'
require "pry"

class Dealer
  attr_accessor :shuffled_deck

  def initialize
    @shuffled_deck = Deck.new.create_deck
    first_deal_to_player
    first_deal_to_dealer
  end

  def first_deal_to_player
    @shuffled_deck.pop(2)
  end

  def first_deal_to_dealer
    @shuffled_deck.pop(2)
  end

  def single_to_player
    @shuffled_deck.pop(1)
  end

  def single_to_dealer
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
