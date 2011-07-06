class Game < Gosu::Window

  def initialize(width, height, fullscreen)
    super(width, height, fullscreen)
    @age = 0
    @text = Gosu::Font.new(self, 'Courier New', 18)
  end

  def button_down(id)
    self.close if id == Gosu::KbEscape
  end

  def update
    @age += 1
  end

  def draw
    banner = [
      "Press 'esc' to end the game...",
      "Age of game (number of ticks): #{commified_age}"
    ].join(' | ')
    @text.draw(banner, 10, self.height - 40, 0)
  end

  private

  def commified_age
    @age.to_s.gsub(/(\d)(?=(\d{3})+$)/,'\1,')
  end

end

class PointGame < Game

  def initialize(width, height, fullscreen, number_of_points, &create_point)
    super(width, height, fullscreen)
    @number_of_points = number_of_points
    @create_point = create_point
    @points = []
  end

  def add_point(x, y, colour = Gosu::Color::WHITE)
    @points << (point = Point.new(x, y, colour))
    return point
  end

  def update

    # STEP 1: purge stale points
    @points = @points.find_all { |point| !point.purge? self }

    # STEP 2: add new points
    while @points.size < @number_of_points
      @create_point.call(self)
    end

    # STEP 3: close game if no more points
    self.close if @points.empty?

    # STEP 4: update each point
    @points.each { |point| point.update self  }

  end

  def draw
    @text.draw("Points: " + @points.size.to_s, 10, 10, 0)
    @points.each { |point| point.draw(self)  }
  end

end

class LineGame < Game

  def initialize(width, height, fullscreen, number_of_lines, &create_line)
    super(width, height, fullscreen)
    @number_of_lines = number_of_lines
    @create_line = create_line
    @lines = []
  end

  def add_line(start_point, end_point)
    @lines << (line = Line.new(start_point, end_point))
    return line
  end

  def update

    # STEP 1: purge stale lines
    @lines = @lines.find_all { |line| !line.purge? self }

    # STEP 2: add new lines
    while @lines.size < @number_of_lines
      @create_line.call(self)
    end

    # STEP 3: close game if no more lines
    self.close if @lines.empty?

    # STEP 4: update each line
    @lines.each { |line| line.update self  }

  end

  def draw
    @text.draw("Lines: " + @lines.size.to_s, 10, 10, 0)
    @lines.each { |line| line.draw(self)  }
  end

end