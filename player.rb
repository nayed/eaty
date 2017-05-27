class Player
  attr_reader :score, :lives

  Y = 390
  ACCELERATION_FACTOR  = 0.5
  SKIDDING_FACTOR = 0.96
  DISTANCE_OF_COLLISION = 40

  def initialize(x, y)
    @x = WINDOW_HEIGHT / 2
    @velocity = 0.0
    @image = Gosu::Image.new("assets/images/player.png")
    @sound_collect = Gosu::Sample.new("assets/sound/collect.ogg")
    @sound_life_lost = Gosu::Sample.new("assets/sound/life-lost.wav")
    @score = 0
    @lives = 3
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
    items.reject! { |item| collide?(item) ? collision(item.type) : false }
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

  def collision(type)
    case type
    when :fish
      @score += 10
      @sound_collect.play(1.0)
    when :turtle
      @lives -= 1
      @sound_life_lost.play(1.0)
    end

    true
  end
end
