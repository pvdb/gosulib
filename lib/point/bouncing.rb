module Bouncing

  def update window
    super
    if self.respond_to? :horizontal_speed
      if self.x <= 0
        self.horizontal_speed = self.horizontal_speed * -1
        self.x = 0
      end
      if self.x >= (window.width - 1)
        self.horizontal_speed = self.horizontal_speed * -1
        self.x = window.width - 1
      end
    end
    if self.respond_to? :vertical_speed
      if self.y <= 0
        self.vertical_speed = self.vertical_speed * -1
        self.y = 0
      end
      if self.y >= (window.height - 1)
        self.vertical_speed = self.vertical_speed * -1
        self.y = window.height - 1
      end
    end
  end

end
