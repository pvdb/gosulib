class BullsEye < PointGame
  def initialize(width, height, fullscreen)
    super(width, height, fullscreen, 8192) do |game|
      x = rand(game.width) ; y = rand(game.height)
      distance = Gosu.distance(x, y, width / 2, height / 2)
      point = game.add_point(x, y, (distance <= 50 || (distance > 100 && distance < 150) || distance > 200) ? Gosu::Color::RED : Gosu::Color::WHITE)
      point.extend(Disappearing)
      point.lifetime = 1
    end
  end
end

$GAME_CLASS = BullsEye