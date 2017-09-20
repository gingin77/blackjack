require_relative '../lib/deck'
require_relative '../lib/hand'
require "pry"

class Dealer
  attr_reader :players_hand, :dealers_hand

  def initialize
    @card_deck = Deck.new
    @players_hand = deal_to_player
    @dealers_hand = deal_to_dealer
  end

  def deal_to_player
    players_hand = []
    players_hand = @card_deck.pop(2)
    print players_hand
  end

  def deal_to_dealer
    dealers_hand = []
    dealers_hand = @card_deck.pop(2)
  end
end

    # Each time a random_card is used to generate an integer, that number needs to be noted... the size of the deck array will go down as cards are picked. an iteration loop AND a reducer of some kind are needed.
    # @hand_dealer =
