module Moving

  def self.extended(object)
    object.instance_variable_set(:@horizontal_speed, 0)
    object.instance_variable_set(:@vertical_speed, 0)
  end

  def horizontal_speed
    @horizontal_speed
  end

  def horizontal_speed= horizontal_speed
    @horizontal_speed = horizontal_speed
  end

  def vertical_speed
    @vertical_speed
  end

  def vertical_speed= vertical_speed
    @vertical_speed = vertical_speed
  end

  def update window
    super
    @x += @horizontal_speed
    @y += @vertical_speed
  end

end
