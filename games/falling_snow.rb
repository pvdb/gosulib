class FallingSnow < PointGame
  def initialize(width, height, fullscreen)
    super(width, height, fullscreen, width / 16) do |game|
      point = game.add_point(rand(width), rand(height) - height)
      point.extend(Moving)
      # point.horizontal_speed = Speed.random(-5, 5)
      point.vertical_speed = 2 + Speed.random(-1, 1, false)
    end
  end
end

$GAME_CLASS = FallingSnow