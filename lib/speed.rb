module Speed
  def self.random(min_speed = -1, max_speed = 1, allow_zero = false)
    speeds = (min_speed..max_speed).to_a
    speeds.delete 0 unless allow_zero
    speeds[rand(speeds.size)]
  end
end
