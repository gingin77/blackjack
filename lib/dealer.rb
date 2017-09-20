require_relative 'deck'
require_relative '../lib/hand'
require "pry"

class Dealer
  attr_reader :players_hand, :dealers_hand

  def initialize
    @shuffled_deck = Deck.new.create_deck
    # @card_deck = deck.card_deck
    puts @shuffled_deck[-4..51]
    puts "^^ shuffled_deck"
    @players_hand = deal_to_player
    @dealers_hand = deal_to_dealer

  end

  def deal_to_player
    players_hand = []
    players_hand = @shuffled_deck.pop(2)
    puts players_hand
    puts "/n ^^players_hand"
    # binding.pry
  end

  def deal_to_dealer
    dealers_hand = []
    dealers_hand = @shuffled_deck.pop(2)
    puts dealers_hand
    puts "/n ^^dealers_hand"
  end

end

    # Each time a random_card is used to generate an integer, that number needs to be noted... the size of the deck array will go down as cards are picked. an iteration loop AND a reducer of some kind are needed.
    # @hand_dealer =
