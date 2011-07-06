#!/usr/bin/env ruby -wKU

require "rubygems"
require "gosu"

$:.unshift File.expand_path '.'
require 'game'

ROOT_DIR = File.expand_path File.dirname __FILE__
GAMES_DIR = File.join ROOT_DIR, 'games'

LIB_DIR = File.join ROOT_DIR, 'lib'
BIN_DIR = File.join ROOT_DIR, 'bin'

Dir.glob("#{LIB_DIR}/**/*.rb").each do |file|
  next if file == File.basename(__FILE__)
  require file.gsub(/\.rb/, '')
end

# STEP 1: find all available games
all_games = Dir.glob("#{GAMES_DIR}/*.rb")

# STEP 2: print game selection menu
all_games.each_with_index do |game, index|
  print "%3s. " % (index + 1)
  puts File.basename game
end

# STEP 3: prompt for game selection
answer = 0 ; until answer >= 1 && answer <= all_games.size
  print "Your answer (1-#{all_games.size}): "
  answer = STDIN.gets.chomp.to_i
end

caption = ""

# STEP 4: load the selected game
unless answer.nil?
  game = all_games[answer - 1]
  require game
  caption = File.basename(game, '.rb').gsub(/_/, ' ')
end

game = ($GAME_CLASS || Game).new(640, 480, false)
game.caption = caption
game.show