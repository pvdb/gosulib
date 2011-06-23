module Colour
  def self.all 
    @all ||= [
      Gosu::Color::BLUE, 
      Gosu::Color::WHITE, 
      Gosu::Color::CYAN, 
      Gosu::Color::GREEN,
      Gosu::Color::GRAY,
      Gosu::Color::FUCHSIA,
      Gosu::Color::RED,
      # Gosu::Color::BLACK,
      Gosu::Color::YELLOW,
      Gosu::Color::AQUA,
    ]
  end
  def self.random
    self.all[rand(self.all.size)]
  end
end
