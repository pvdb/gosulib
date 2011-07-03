#!/usr/bin/env ruby -wKU

require "rubygems"
require "gosu"

Dir.glob('**/*.rb').each do |file|
  next if file == File.basename(__FILE__)
  require file.gsub(/\.rb/, '')
end

game = Game.new(640, 480, false)
game.show
