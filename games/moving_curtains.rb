class MovingCurtains < PointGame
  def initialize(width, height, fullscreen)
    super(width, height, fullscreen, 1024) do |game|
      point = game.add_point(rand(game.width), rand(game.height), Gosu::Color::GREEN)
      point.extend(Moving)
      point.horizontal_speed = Speed.random
      # point.vertical_speed = Speed.random
    end
  end
end

$GAME_CLASS = MovingCurtains
