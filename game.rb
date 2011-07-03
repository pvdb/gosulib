class Game < Gosu::Window

  def initialize(width, height, fullscreen)
    super(width, height, fullscreen)
    @text = Gosu::Font.new(self, 'Monaco', 24)
  end

  def button_down(id)
    self.close if id == Gosu::KbEscape
  end
  
  def draw
    @text.draw("Press 'esc' to end the game...", 10, 10, 0)
  end

end

class PointGame < Game
  
  def initialize(width, height, fullscreen)
    super(width, height, fullscreen)
    @points = []
  end

  def add_point(x, y, colour = Gosu::Color::WHITE)
    @points << (point = Point.new(x, y, colour))
    return point
  end
  
  def update
    self.close if @points.empty?

    @points = @points.find_all { |point| !point.purge? self }
    @points.each { |point| point.update self  }
  end

  def draw
    @text.draw("Points: " + @points.size.to_s, 10, 10, 0)
    @points.each { |point| point.draw(self)  }
  end
  
end

class LineGame < Game
  
  def initialize(width, height, fullscreen)
    super(width, height, fullscreen)
    @lines = []
  end

  def add_line(start_point, end_point)
    @lines << (line = Line.new(start_point, end_point))
    return line
  end

  def update
    self.close if @lines.empty?

    @lines = @lines.find_all { |line| !line.purge? self }
    @lines.each { |line| line.update self  }
  end

  def draw
    @text.draw("Lines: " + @lines.size.to_s, 10, 10, 0)
    @lines.each { |line| line.draw(self)  }
  end
  
end