require_relative '../lib/card'

class Deck
  attr_reader :card_deck

  RANKS = [:A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]
  SUITS = [:clubs, :diamonds, :hearts, :spades]

  def initialize
    @card_deck = create_deck
  end

  def create_deck
    card_deck = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        card_deck.push(Card.new(rank, suit))
      end
    end
    card_deck.shuffle
  end

  def num_cards_in_deck
    @card_deck.length
  end
end
