require 'pry'

class Game
  def initialize(response, hand: 1)
    @response = response
    @hand = hand
  end

  # def start_display
  #   # hand.card_sum
  #   string_hard = ("Hello and welcome to the game of blackjack! Let's begin.
  #
  #   You have $100 and bet $10.
  #
  #   You have a #{card1} and a #{card2}.
  #   Your total is #{}"+ stars + "\n")
  #   print string
  # end

  def get_hit_or_stand
    while true
      print "Do you want to (h)it or (s)tand?  "
      response = gets.chomp.downcase
      if @response[0] == "h"
        return true
      elsif @response[0] == "s"
        return false
      end
      puts "That is not a valid response!"
    end
    dealer_deals
  end


  def dealer_deals(*response)
    print "Because you said #{response}, the dealer will now give you a new card."
  end
  # binding.pry
end
