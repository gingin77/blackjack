require "pry"

class Player
  attr_accessor :bet, :money
  def initialize
    @bet = 10
    @money = 100
  end

  def hit_or_stand
    while true
      print "\nDo you want to hit or stand? Enter (h) or (s).  "
      response = gets.chomp.downcase
      if response == "h"
        return true
      elsif response == "s"
        return false
      else
      puts "\nThat is not a valid response!"
      end
    end
  end

  def new_hand
    while true
      print "\nDo you want to play another hand? Enter (y) or (n).  "
      response = gets.chomp.downcase
      if response == "y"
        return true
      elsif response == "n"
        return false
      else
        puts "\nThat is not a valid response!"
      end
    end
  end

  def loose_money
    @money = @money - @bet
  end

  def add_money
    @money = @money + @bet
  end
end
