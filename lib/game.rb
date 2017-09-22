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
    hand = Hand.new(@dealer.two_to_player, @dealer.two_to_dealer)
    if @player.hit_or_stand == false
      print "
      " + hand.compare_player_to_dealer + "
      "
    else
      @dealer.deal_one_card_to_player
    end
  end

  def start_display
    print "
    Hello and welcome to the game of blackjack!

    Let's begin. You have $100 and you have to bet $10 on each hand.

    Aces are worth 1 or 11 and will be evaluated in your favor.

    "
  end
end
