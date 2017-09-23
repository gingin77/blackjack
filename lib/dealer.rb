require_relative 'deck'
require_relative 'hands'
require 'pry'

class Dealer
  attr_accessor :shuffled_deck

  def initialize
    @shuffled_deck = Deck.new.create_deck
  end

  def deal_two_cards
    @shuffled_deck.pop(2)
  end

  def deal_one_card
    @shuffled_deck.pop(1)
  end
end
