class Line

  attr_accessor :start_point, :end_point

  def initialize(start_point, end_point)
    @start_point = start_point
    @end_point = end_point
  end

  def length
    Gosu.distance(@start_point.x, @start_point.y, @end_point.x, @end_point.y)
  end

  def purge? window
    @start_point.purge?(window) && @end_point.purge?(window)
  end

  def update window
    @start_point.update window
    @end_point.update window
  end

  def draw window
    window.draw_line(@start_point.x, @start_point.y, @start_point.colour, @end_point.x, @end_point.y, @end_point.colour)
  end

end