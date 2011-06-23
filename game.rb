class Game < Gosu::Window

  def initialize(width, height, fullscreen)
    super(width, height, fullscreen)
    @points = []
  end

  def add_point(x, y, colour = Gosu::Color::WHITE)
    @points << Point.new(x, y, colour)
  end

  def update
    @points = @points.find_all { |point| !point.purge? }
    @points.each { |point| point.update  }
  end

  def draw
    @points.each { |point| point.draw(self)  }
  end

  def button_down(id)
    self.close if id == Gosu::KbEscape
  end

end