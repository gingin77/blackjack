require_relative 'card'
require 'pry'

class Deck
  attr_reader :card_deck

  RANKS = [:Ace, 2, 3, 4, 5, 6, 7, 8, 9, 10, :Jack, :Queen, :King]
  SUITS = [:clubs, :diamonds, :hearts, :spades]

  def initialize
    @card_deck = create_deck
  end

  def create_deck
    card_deck = []
    card_deck = RANKS.flat_map do |rank|
      SUITS.map do |suit|
        Card.new(rank, suit)
      end
    end
    card_deck.shuffle!
  end

  def num_cards_in_deck
    @card_deck.length
  end
end
