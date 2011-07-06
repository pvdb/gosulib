class ColourfulPoints < PointGame
  def initialize(width, height, fullscreen)
    super(width, height, fullscreen, width * height / 16) do |game|
      point = game.add_point(rand(game.width), rand(game.height), Colour.random)
      point.extend(Colourful)
      point.extend(Disappearing)
      point.lifetime = rand(10)
    end
  end
end

$GAME_CLASS = ColourfulPoints