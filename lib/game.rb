require_relative 'dealer'
require_relative 'player'
require_relative 'hand'
require 'pry'

class Game
  attr_accessor :dealer, :player

  def initialize
    @dealer = Dealer.new
    @player = Player.new
    start_game
  end

  def start_game
    start_display
    Hand.new(@dealer.first_deal_to_player, @dealer.first_deal_to_dealer)
    @player.hit_or_stand
  end

  def start_display
    print "
    Hello and welcome to the game of blackjack!

    Let's begin. You have $100 and bet $10.

    "
  end


end
