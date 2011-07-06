class DisappearingLines < LineGame
  def initialize(width, height, fullscreen)
    super(width, height, fullscreen, 4) do |game|
      start_point = Point.new(rand(game.width), rand(game.height), Colour.random)
        start_point.extend(Colourful)
        start_point.extend(Moving)
        start_point.extend(Disappearing)
        start_point.lifetime = rand(300)
        start_point.horizontal_speed = Speed.random
        start_point.vertical_speed = Speed.random
      end_point = Point.new(rand(game.width), rand(game.height), Colour.random)
        end_point.extend(Colourful)
        end_point.extend(Moving)
        end_point.extend(Disappearing)
        end_point.lifetime = rand(300)
        end_point.horizontal_speed = Speed.random
        end_point.vertical_speed = Speed.random
      game.add_line start_point, end_point
    end
  end
end

$GAME_CLASS = DisappearingLines