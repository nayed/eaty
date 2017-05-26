class Player
  attr_reader :score

  Y = 390
  ACCELERATION_FACTOR  = 0.5
  SKIDDING_FACTOR = 0.96
  DISTANCE_OF_COLLISION = 40

  def initialize(x, y)
    @x = WINDOW_HEIGHT / 2
    @velocity = 0.0
    @image = Gosu::Image.new("assets/images/player.png")
    @sound_collect = Gosu::Sample.new("assets/sound/collect.ogg")
    @score = 0
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

  def collect(items)
    items.reject! { |item| collide?(item) ? collision : false }
  end

  private

  def collide?(item)
    distance = Gosu::distance(x_center_of_mass,
                              y_center_of_mass,
                              item.x_center_of_mass,
                              item.y_center_of_mass)
    distance < DISTANCE_OF_COLLISION
  end

  def x_center_of_mass
    @x + @image.width / 2
  end

  def y_center_of_mass
    Y + @image.height / 4
  end

  def collision
    @score += 10
    @sound_collect.play(1.0)
    true
  end
end
