class Point

  attr_accessor :x, :y, :colour

  def initialize(x, y, colour)
    @x = x
    @y = y
    @colour = colour
  end

  def purge?
    false
  end

  def update
    # NOOP
  end

  def draw(window)
    window.draw_line(@x, @y, @colour, @x + 1, @y + 1, @colour)
  end

end
