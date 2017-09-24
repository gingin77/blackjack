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
    display_money_status
    if @hands.blackjack?(@hands.players_hand) == true
      hand_is_blackjack
      @player.add_money
      play_new_hand?
    else
      @hands.score_status(@hands.players_hand, @hands.dealers_hand)
      hit_or_stand
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
    else
      hand_ends
      @player.loose_money
    end
  end

  def hand_ends
    print "\n#{@hands.compare_player_to_dealer}\n"
    play_new_hand?
  end

  def hand_is_blackjack
    print "\n****** Congratulations, you have blackjack! ******\n"
  end


  def play_new_hand?
    display_money_status
    if @player.new_hand == true
      start_new_hand
    else
    print "\nThanks for playing!\n"
    end
  end

  def start_display
    print "\nHello and welcome to the game of blackjack!
    \nAces are worth 1 or 11 and will be evaluated in your favor.\n"
  end

  def display_money_status
    print "\nYou currently have $#{@player.money} and each hand requires a $#{@player.bet} bet to play."
    # binding.pry
  end
end
