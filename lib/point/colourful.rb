module Colourful

  def update window
    super
    @colour = Colour.random
  end
  
end
