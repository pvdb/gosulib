module Bouncing

  def update window
    super
    if self.respond_to? :horizontal_speed
      if self.x < 0 || self.x >= window.width
        self.horizontal_speed = self.horizontal_speed *= -1
      end
    end
    if self.respond_to? :vertical_speed
      if self.y < 0 || self.y >= window.height
        self.vertical_speed = self.vertical_speed *= -1
      end
    end
  end
  
end
