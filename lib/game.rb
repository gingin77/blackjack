require_relative 'dealer'
require_relative 'player'
require_relative 'hands'
require 'pry'

class Game
  attr_accessor :dealer, :player

  def initialize
    @dealer = Dealer.new
    @player = Player.new
    @hands = Hands.new(@dealer)
    start_new_game
  end

  def start_new_game
    start_display
    start_new_hand
  end

  def start_new_hand
    @hands = Hands.new(@dealer)
    under_21 = @hands.under_21(@hands.players_hand)

    if @hands.blackjack?(@hands.players_hand) == true
      hand_is_blackjack
      play_new_hand?
    elsif under_21 == true
      @hands.score_status(@hands.players_hand, @hands.dealers_hand)
      hit_or_stand
    elsif under_21 == false
      print "Your hand is over"
      play_new_hand?
    end
  end

  def hit_or_stand
    if player.hit_or_stand == true
      handle_hit
    else
      hand_ends
    end
  end

  def handle_hit
    @hands.player_accepts_new_card(@dealer.deal_one_card)
    @hands.score_status(@hands.players_hand, @hands.dealers_hand)
    if @hands.under_21(@hands.players_hand) == true
      hit_or_stand
          binding.pry
    else
      hand_ends
    end
  end

  def hand_ends
    print "
        " + @hands.compare_player_to_dealer + "
        "
    play_new_hand?
  end

  def hand_is_blackjack
    print "
    ****** Congratulations, you have blackjack! ******
    "
    # play_new_hand?
  end


  def play_new_hand?
    if @player.new_hand == true
      start_new_hand
      # continue_with_hand? this method hasn't yet been written....
    else
      print "
      Thanks for playing!
      "
      # end_game
    end
  end

  def start_display
    print "
    Hello and welcome to the game of blackjack!

    Let's begin. You have $100 and you have to bet $10 on each hand.

    Aces are worth 1 or 11 and will be evaluated in your favor.

    "
  end

  def end_game?
    true
  end
end
