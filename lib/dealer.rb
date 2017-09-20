require_relative 'deck'
require_relative 'hand'
require "pry"

class Dealer
  attr_reader :players_hand, :dealers_hand

  def initialize
    @shuffled_deck = Deck.new.create_deck
    @players_hand = deal_to_player
    @dealers_hand = deal_to_dealer
    Hand.new(@players_hand)
  end

  def deal_to_player
    @shuffled_deck.pop(2)
  end

  def deal_to_dealer
    @shuffled_deck.pop(2)
  end

  def puts_hands
    puts @shuffled_deck[-2..51]
    puts "^^ shuffled_deck"
    puts @players_hand
    puts "/n ^^players_hand"
    puts @dealers_hand
    puts "/n ^^dealers_hand"
  end

end

    # Each time a random_card is used to generate an integer, that number needs to be noted... the size of the deck array will go down as cards are picked. an iteration loop AND a reducer of some kind are needed.
    # @hand_dealer =
