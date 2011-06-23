#!/usr/bin/env ruby -wKU

require "rubygems"
require "gosu"

Dir.glob('**/*.rb').each do |file|
  next if file == File.basename(__FILE__)
  require file.gsub(/\.rb/, '')
end

game = Game.new(640, 480, false)

1.upto(1024) do
  game.add_point(rand(game.width), rand(game.height))
end

game.show
