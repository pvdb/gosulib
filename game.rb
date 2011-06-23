class Game < Gosu::Window

  def initialize(width, height, fullscreen)
    super(width, height, fullscreen)
    @points = [] ; @lines = []
    @text = Gosu::Font.new(self, 'Monaco', 24)
  end

  def add_point(x, y, colour = Gosu::Color::WHITE)
    @points << (point = Point.new(x, y, colour))
    return point
  end

  def add_line(start_point, end_point)
    @lines << (line = Line.new(start_point, end_point))
    return line
  end

  def update
    self.close if @points.empty? && @lines.empty?

    @points = @points.find_all { |point| !point.purge? self }
    @points.each { |point| point.update  }

    @lines = @lines.find_all { |line| !line.purge? self }
    @lines.each { |line| line.update  }
  end

  def draw
    @text.draw("Points: " + @points.size.to_s, 10, 10, 0)
    @points.each { |point| point.draw(self)  }

    @text.draw("Lines: " + @lines.size.to_s, 10, 40, 0)
    @lines.each { |line| line.draw(self)  }
  end

  def button_down(id)
    self.close if id == Gosu::KbEscape
  end

end