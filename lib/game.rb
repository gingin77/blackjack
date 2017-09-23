require_relative 'dealer'
require_relative 'player'
require_relative 'hand'
require 'pry'

class Game
  attr_accessor :dealer, :player

  def initialize
    @dealer = Dealer.new
    @player = Player.new
    start_new_game
  end

  def start_new_game
    start_display
    start_new_hand
  end

  def start_new_hand
    hands = Hand.new(@dealer)
    # binding.pry
    if hands.blackjack?(hands.players_hand) == true
      hand_is_blackjack
    else
      if @player.hit_or_stand == false
        print "
        " + hands.compare_player_to_dealer + "
        "
      else
        hands.player_accepts_new_card(@dealer.deal_one_card_to_player)
        hands.score_status(hands.players_hand, hands.dealers_hand)
      end
      play_new_hand?
    end
  end

  def hand_is_blackjack
    print "****** Congratulations, you have blackjack! ******
    "
    # bets??
    play_new_hand?
  end


  def play_new_hand?
    if @player.new_hand == true
      start_new_hand
      # continue_with_hand? this method hasn't yet been written....
    else
      print "Thanks for playing!
      "
    end
  end

  def start_display
    print "
    Hello and welcome to the game of blackjack!

    Let's begin. You have $100 and you have to bet $10 on each hand.

    Aces are worth 1 or 11 and will be evaluated in your favor.

    "
  end

  def continue_with_hand?
    # I still need to figure out how to incorporate bets and end the game.
  end

  def end_game?
    false
  end
end
