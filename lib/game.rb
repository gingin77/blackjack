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
    calculate_bets
    play_new_hand?
  end

  def calculate_bets
    @hands.bets_handler
    if @hands.tie == false && @hands.hand_wins == true
      @player.money = @player.add_money
    elsif @hands.tie == false && @hands.hand_wins == false
      @player.money = @player.loose_money
    elsif @hands.tie == true
      @player.money = @player.money
    end
  end

  def hand_is_blackjack
    print Rainbow("\n
    *  *  *  *  Congratulations, you have blackjack! *  *  *  *  \n").bg(:springgreen)
    calculate_bets
    play_new_hand?
  end


  def play_new_hand?
    space_width = 20
    space = " " * space_width
    print "\n#{space}** End of hand **#{space}\n\n"
    if @dealer.shuffled_deck.length < 20
      print "getting new deck"
      @dealer.get_new_deck
    end
    display_money_status
    if @player.new_hand == true
      start_new_hand
    else
    print "\nThanks for playing!\n"
    end
  end

  def start_display
    space_width = 20
    space = " " * space_width
    print Rainbow("\n\n#{space}Hello and welcome to the game of blackjack!#{space}\n").bg(:silver) +
    "\n
    \nThere is one deck in the shoe and the dealer will shuffle when cards start to get low.
    \nAces are worth 1 or 11 and will be evaluated in your favor.\n"
  end

  def display_money_status
    print "\nYou currently have " + Rainbow("$").blue + Rainbow("#{@player.money}").blue + " and each hand requires a " + Rainbow("$").blue + Rainbow("#{@player.bet}").blue + " bet to play.\n"
  end
end
