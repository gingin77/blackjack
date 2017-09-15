#!/usr/bin/env ruby

require_relative '../lib/pig'
require_relative '../lib/player'

players = []

ARGV.each do |arg|
  player_class = arg
  if defined?(player_class)
    players.push(Module.const_get(player_class).new(arg.gsub(/Player$/, "")))
  end
end

if players.length < 2
  players.push(CautiousPlayer.new("Cautious1"))
end
if players.length == 1
  players.push(CautiousPlayer.new("Cautious2"))
end

pig = Pig.new(*players, games: 100, silent: true)
pig.run
