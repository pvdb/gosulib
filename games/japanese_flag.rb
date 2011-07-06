class JapaneseFlag < PointGame
  def initialize(width, height, fullscreen)
    super(width, height, fullscreen, 8192) do |game|
      x = rand(game.width / 2) + game.width / 4 ; y = rand(game.height / 2) + game.height / 4
      distance = Gosu.distance(x, y, width / 2, height / 2)
      point = game.add_point(x, y, distance <= 75 ? Gosu::Color::RED : Gosu::Color::WHITE)
      point.extend(Disappearing)
      point.lifetime = 1
    end
  end
end

$GAME_CLASS = JapaneseFlag