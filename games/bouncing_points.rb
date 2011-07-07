class BouncingPoints < PointGame
  def initialize(width, height, fullscreen)
    super(width, height, fullscreen, 16) do |game|
      point = game.add_point(rand(game.width), rand(game.height), Colour.random)
      point.extend(Moving)
      point.horizontal_speed = Speed.random(-10, 10)
      point.vertical_speed = Speed.random(-10, 10)
      point.extend(Bouncing)
    end
  end
end

$GAME_CLASS = BouncingPoints