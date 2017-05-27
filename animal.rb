class Animal
  attr_reader :x, :y, :type

  def initialize(type)
    @type = type

    @image = if type == :fish
               Gosu::Image.new("assets/images/fish1.png")
             elsif type == :turtle
               Gosu::Image.new("assets/images/turtle.png")
             end
    
    @velocity = Gosu::random(0.8, 3.3)

    @x = rand * (WINDOW_WIDTH- @image.width)
    @y = 0
  end

  def update
    @y += @velocity
  end

  def draw
    @image.draw(@x, @y, ZOrder::ITEMS)
  end

  def x_center_of_mass
    @x + @image.width / 2
  end

  def y_center_of_mass
    @y
  end
end
