class Window < Gosu::Window
  def initialize(width, height)
    super
    self.caption = "Eat the fish!"

    @background_image = Gosu::Image.new("assets/images/background.png")

    @player = Player.new(width / 2, height / 2)
  end

  def draw
    @background_image.draw(0, 0, ZOrder::Background)
    @player.draw
  end
end
