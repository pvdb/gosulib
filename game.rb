class Game < Gosu::Window

  def initialize(width, height, fullscreen)
    super(width, height, fullscreen)
    @points = []
    @text = Gosu::Font.new(self, 'Monaco', 24)
  end

  def add_point(x, y, colour = Gosu::Color::WHITE)
    @points << (point = Point.new(x, y, colour))
    return point
  end

  def update
    self.close if @points.empty?
    @points = @points.find_all { |point| !point.purge? self }
    @points.each { |point| point.update  }
  end

  def draw
    @text.draw("Points: " + @points.size.to_s, 10, 10, 0)
    @points.each { |point| point.draw(self)  }
  end

  def button_down(id)
    self.close if id == Gosu::KbEscape
  end

end