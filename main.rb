#!/usr/bin/env ruby -wKU

require "rubygems"
require "gosu"

Dir.glob('**/*.rb').each do |file|
  next if file == File.basename(__FILE__)
  require file.gsub(/\.rb/, '')
end

game = Game.new(640, 480, false)

1.upto(1024) do
  point = game.add_point(rand(game.width), rand(game.height))
  point.extend(Disappearing)
  point.lifetime = rand(300)
end

game.show
