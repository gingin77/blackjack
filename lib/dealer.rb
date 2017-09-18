require_relative '../lib/deck'
require_relative '../lib/hand'

class Dealer
  attr_reader :players_hand, :dealers_hand
  @players_hand = deal_to_player
  @dealers_hand = deal_to_dealer

  def deal_to_player

    players_hand = @card_deck.pop(2)
  end

  def deal_to_dealer
    dealers_hand = []
    dealers_hand = @card_deck.pop(2)
  end

    # Each time a random_card is used to generate an integer, that number needs to be noted... the size of the deck array will go down as cards are picked. an iteration loop AND a reducer of some kind are needed.
    # @hand_dealer =
