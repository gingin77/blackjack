require 'pry'
require_relative '../lib/deck'
require_relative '../lib/dealer'
require_relative '../lib/player'

class Game
  attr_accessor :player

  def initialize
    @dealer = Dealer.new
    @player = Player.new
    @deck = Deck.new
  end

  def start_game
    deal_dealers_hand
    deal_players_hand
    start_display
    player.hit_or_stand
  end

  def dealer_starts_game
    if @response == true
      print "The dealer will now give you a new card. \n\n"
    elsif @response == false
      print "You decided to stand. \n\n"
    end
  end
end

# Prior to start_display, I want to know the sum of the player's hand.
  def start_display
    string_hard = ("Hello and welcome to the game of blackjack! Let's begin.

    You have $100 and bet $10."

    You have a #{card1} and a #{card2}.
    Your total is #{}"+ stars + "\n")"
    print string_hard
  end
