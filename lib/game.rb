require 'pry'

class Game
  attr_accessor :player

  def initialize
    puts "Welcome to the Blackjack Table\n\n"
    @player = Player.new
    @response = player.hit_or_stand
    dealer_deals
  end

  def dealer_deals
    if @response == true
      print "The dealer will now give you a new card. \n\n"
    elsif @response == false
      print "You decided to stand. \n\n"
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
