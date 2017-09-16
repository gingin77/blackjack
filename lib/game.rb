require 'pry'

class Game
  attr_accessor :player

  def initialize
    @player = Player.new
    puts "Playing Blackjack...\n\n"

    @response = player.hit_or_stand
    # ? "true" : "false"
    puts "The response is "
    dealer_deals
  end

  def dealer_deals
    puts "the dealer doesn't know what to do yet"
      if @response == true
        print "The dealer will now give you a new card. \n\n"
      elsif @response == false
        print "You decided to stand. \n\n"
      # end
    end
  end
end

  # def start_display
  #   # hand.card_sum
  #   string_hard = ("Hello and welcome to the game of blackjack! Let's begin.
  #
  #   You have $100 and bet $10."
  #
  #   # You have a #{card1} and a #{card2}.
  #   # Your total is #{}"+ stars + "\n")"
  #   print string_hard
  # end
