require "pry"

class Player
  attr_accessor :response
  #  :name

  def hit_or_stand
    while true
      print "Do you want to hit or stand? Enter (h) or (s).  "
      response = gets.chomp.downcase
      if response[0] == "h"
        return true
      elsif response[0] == "s"
        return false
      end
      puts "That is not a valid response!"
      response
    end
  end
end
