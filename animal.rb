class Animal
  attr_reader :y

  def initialize(type)
    @image = if type == :animal_up
               Gosu::Image.new("assets/images/fish1.png")
             elsif type == :animal_down
               Gosu::Image.new("assets/images/turtle.png")
             end
    
    @velocity = Gosu::random(0.8, 3.3)

    @x = rand * (WindowWidth - @image.width)
    @y = 0
  end

  def update
    @y += @velocity
  end

  def draw
    @image.draw(@x, @y, ZOrder::Items)
  end
end
