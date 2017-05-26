class Player
  Y = 390
  ACCELERATION_FACTOR  = 0.5
  SKIDDING_FACTOR = 0.96

  def initialize(x, y)
    @x = WINDOW_HEIGHT / 2
    @velocity = 0.0
    @image = Gosu::Image.new("assets/images/player.png")
  end

  def draw
    @image.draw(@x, Y, ZOrder::PLAYER)
  end

  def go_left
    @velocity -= ACCELERATION_FACTOR 
  end

  def go_right
    @velocity += ACCELERATION_FACTOR 
  end

  def move
    @x += @velocity
    @x %= WINDOW_WIDTH
    @velocity *= SKIDDING_FACTOR
  end
end
