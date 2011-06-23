module Disappearing

  def self.extended(object)
    object.instance_variable_set(:@age, 0)
    object.instance_variable_set(:@lifetime, 0)
  end
  
  def age= age
    @age = age
  end
  
  def lifetime= lifetime
    @lifetime = lifetime
  end
  
  def update
    super
    @age += 1
  end
  
  def purge? window
    (@age > @lifetime) || super(window)
  end
  
end