#!/usr/bin/env ruby -wKU

require "rubygems"
require "gosu"

Dir.glob('**/*.rb').each do |file|
  next if file == File.basename(__FILE__)
  require file.gsub(/\.rb/, '')
end


game = Game.new(640, 480, false)

# 1.upto(128) do
#   start_point = Point.new(rand(game.width), rand(game.height), Colour.random)
#     start_point.extend(Moving)
#     start_point.extend(Disappearing)
#     start_point.lifetime = rand(300)
#     start_point.horizontal_speed = Speed.random
#     start_point.vertical_speed = Speed.random
#   end_point = Point.new(rand(game.width), rand(game.height), Colour.random)
#     end_point.extend(Moving)
#     end_point.extend(Disappearing)
#     end_point.lifetime = rand(300)
#     end_point.horizontal_speed = Speed.random
#     end_point.vertical_speed = Speed.random
#   game.add_line start_point, end_point
# end
# 1.upto(1024) do
#   point = game.add_point(rand(game.width), rand(game.height))
#   point.extend(Disappearing)
#   point.lifetime = rand(300)
# end
# 1.upto(1024) do
#   point = game.add_point(rand(game.width), rand(game.height))
#   point.extend(Moving)
#   point.horizontal_speed = Speed.random
#   point.vertical_speed = Speed.random
# end
# 1.upto(1024) do
#   point = game.add_point(rand(game.width), rand(game.height), Colour.random)
#   point.extend(Moving)
#   point.horizontal_speed = Speed.random
#   point.vertical_speed = Speed.random
# end
1.upto(1024) do
  point = game.add_point(game.width / 2, game.height / 2, Colour.random)
  point.extend(Moving)
  point.horizontal_speed = Speed.random(-10, 10)
  point.vertical_speed = Speed.random(-10, 10)
end
# 1.upto(1024) do
#   point = game.add_point(rand(game.width), rand(game.height), Gosu::Color::GREEN)
#   point.extend(Moving)
#   # point.horizontal_speed = Speed.random
#   point.vertical_speed = Speed.random
# end

game.show
