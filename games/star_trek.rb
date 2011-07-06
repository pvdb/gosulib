class StarTrek < PointGame
  def initialize(width, height, fullscreen)
    super(width, height, fullscreen, 20) do |game|
      # point = game.add_point(game.width / 2 + Speed.random(-20, 20, true), game.height / 2 + Speed.random(-20, 20, true), Colour.random)
      point = game.add_point(game.width / 2, game.height / 2, Colour.random)
      point.extend(Moving)
      point.horizontal_speed = Speed.random(-5, 5)
      point.vertical_speed = Speed.random(-5, 5)
    end
  end
end

$GAME_CLASS = StarTrek