class MovingPoints < PointGame
  def initialize(width, height, fullscreen)
    super(width, height, fullscreen, 1024) do |game|
      point = game.add_point(rand(game.width), rand(game.height), Gosu::Color::YELLOW)
      point.extend(Moving)
      point.horizontal_speed = Speed.random(-10, 10)
      point.vertical_speed = Speed.random(-10, 10)
    end
  end
end

$GAME_CLASS = MovingPoints