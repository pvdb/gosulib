class DisappearingPoints < PointGame
  def initialize(width, height, fullscreen)
    super(width, height, fullscreen, 1024) do |game|
      point = game.add_point(rand(game.width), rand(game.height), Colour.random)
      point.extend(Disappearing)
      point.lifetime = rand(300)
    end
  end
end

$GAME_CLASS = DisappearingPoints