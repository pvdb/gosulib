class Line
  
  def initialize(start_point, end_point)
    @start_point = start_point
    @end_point = end_point
  end
  
  def purge? window
    @start_point.purge?(window) && @end_point.purge?(window)
  end

  def update
    @start_point.update
    @end_point.update
  end
  
  def draw window
    window.draw_line(@start_point.x, @start_point.y, @start_point.colour, @end_point.x, @end_point.y, @end_point.colour)
  end
  
end