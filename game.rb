class Game < Gosu::Window

  def initialze(width, height, fullscreen)
    super(width, height, fullscreen)
  end

  def button_down(id)
    self.close if id == Gosu::KbEscape
  end

end