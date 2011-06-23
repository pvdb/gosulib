class Point

  attr_accessor :x, :y, :colour

  def initialize(x, y, colour)
    @x = x
    @y = y
    @colour = colour
  end

  def purge? window
    @x < 0 || @x >= window.width || @y < 0 || @y >= window.height
  end

  def update window
    # NOOP
  end

  def draw window
    window.draw_line(@x, @y, @colour, @x + 1, @y + 1, @colour)
  end

end
