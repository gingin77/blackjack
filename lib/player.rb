require "pry"

class Player
  def initialize
    @bet = 10
    @money = 100
  end

  def hit_or_stand
    while true
      print "Do you want to hit or stand? Enter (h) or (s).  "
      response = gets.chomp.downcase
      if response == "h"
        return true
      elsif response == "s"
        return false
      end
      puts "That is not a valid response!"
      response
    end
  end

  def new_hand
    while true
      print "Do you want to play another hand? Enter (y) or (n).  "
      response = gets.chomp.downcase
      if response == "y"
        return true
      elsif response == "n"
        return false
      end
      puts "That is not a valid response!"
      response
    end
  end

  def lose_bet
    @money - @bet
  end

  def add_money
    @money + @bet
  end
end
