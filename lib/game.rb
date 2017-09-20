require 'pry'
require_relative 'deck'
require_relative 'dealer'
require_relative '../lib/player'

class Game
  attr_accessor :dealer, :player, :deck

  def initialize
    @dealer = Dealer.new
    @player = Player.new
    start_game
  end

  def start_game
    start_display
    
    @player.hit_or_stand
  end

  def start_display
    string_hard = "Hello and welcome to the game of blackjack! Let's begin. You have $100 and bet $10.

    "
    #
    # You have a #{card1} and a #{card2}.
    # Your total is #{}"+ stars + "\n")"
    print string_hard
  end
end

# # Prior to start_display, I want to know the sum of the player's hand.
