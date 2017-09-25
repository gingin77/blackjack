require_relative 'dealer'
require_relative 'player'
require_relative 'hands'
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
    end
    # binding.pry
  end

  def hand_is_blackjack
    print "
    ****** Congratulations, you have blackjack! ******
    "
    # play_new_hand?
  end

    end
  end

  def handle_hit
    @hands.player_accepts_new_card(@dealer.deal_one_card)
    @hands.score_status(@hands.players_hand, @hands.dealers_hand)
    if @hands.under_21(@hands.players_hand) == true
      hit_or_stand
    else
      hand_ends
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
      @dealer.get_new_deck
    end
    display_money_status
    if @player.new_hand == true
      start_new_hand
    else
    print "\nThanks for playing!\n\n"
    end
  end

  end
end
