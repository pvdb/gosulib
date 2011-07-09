class FallingSnow < PointGame

  def initialize(width, height, fullscreen)

    super(width, height, fullscreen, width / 8) do |game|
      point = game.add_point(rand(width), rand(8))
      point.extend(Moving)
      point.vertical_speed = Speed.random(1, 4)
    end

    @lines = (0..width - 1).map { |x|
      Line.new(Point.new(x, height - 1), Point.new(x, height - 1))
    }

  end

  def update
    @points.each do |point|
      line = @lines[point.x]
      if point.next_y >= line.start_point.y
        point.y = height # so it gets purged
        line.start_point.y -= 1
      end
    end
    super
  end

  def draw
    super
    @lines.map { |line| line.draw self }
  end

end

$GAME_CLASS = FallingSnow