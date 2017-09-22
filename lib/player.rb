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
    binding.pry
  end
end
