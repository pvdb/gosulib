#!/usr/bin/env ruby -wKU

require "rubygems"
require "gosu"

Dir.glob('**/*.rb').each do |file|
  next if file == File.basename(__FILE__)
  require file.gsub(/\.rb/, '')
end

speeds = (-5..5).to_a

game = Game.new(640, 480, false)

1.upto(128) do
  start_point = Point.new(rand(game.width), rand(game.height), Gosu::Color::RED)
    start_point.extend(Moving)
    start_point.horizontal_speed = speeds[rand(speeds.size)]
    start_point.vertical_speed = speeds[rand(speeds.size)]
  end_point = Point.new(rand(game.width), rand(game.height), Gosu::Color::BLUE)
    end_point.extend(Moving)
    end_point.horizontal_speed = speeds[rand(speeds.size)]
    end_point.vertical_speed = speeds[rand(speeds.size)]
  game.add_line start_point, end_point
end
# 1.upto(1024) do
#   point = game.add_point(rand(game.width), rand(game.height))
#   point.extend(Disappearing)
#   point.lifetime = rand(300)
# end
# 1.upto(1024) do
#   point = game.add_point(rand(game.width), rand(game.height))
#   point.extend(Moving)
#   point.horizontal_speed = speeds[rand(speeds.size)]
#   point.vertical_speed = speeds[rand(speeds.size)]
# end
# 1.upto(1024) do
#   point = game.add_point(rand(game.width), rand(game.height), Gosu::Color::RED)
#   point.extend(Moving)
#   point.horizontal_speed = speeds[rand(speeds.size)]
#   # point.vertical_speed = speeds[rand(speeds.size)]
# end
# 1.upto(1024) do
#   point = game.add_point(rand(game.width), rand(game.height), Gosu::Color::GREEN)
#   point.extend(Moving)
#   # point.horizontal_speed = speeds[rand(speeds.size)]
#   point.vertical_speed = speeds[rand(speeds.size)]
# end

game.show
