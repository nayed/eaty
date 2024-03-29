class Window < Gosu::Window
  def initialize(width, height)
    super
    self.caption = "Eat the fish!"

    @background_image = Gosu::Image.new("assets/images/background.png")

    @player = Player.new(width / 2, height / 2)

    @items = []

    @ui = UI.new
  end

  def update
    update_items
    update_player
  end

  def draw
    @background_image.draw(0, 0, ZOrder::BACKGROUND)

    @items.each(&:draw)

    @player.draw

    @ui.draw(@player)
  end

  private

  def update_items
    populate_items

    @items.each(&:update)
    @items.reject! { |item| item.y > WINDOW_HEIGHT }
  end

  def populate_items
    return if @items.size >= 15

    type = rand
    if type < 0.035
      @items.push(Animal.new(:fish))
    elsif type < 0.040
      @items.push(Animal.new(:turtle))
    end
  end

  def update_player
    @player.go_left if Gosu::button_down?(Gosu::KbLeft)
    @player.go_right if Gosu::button_down?(Gosu::KbRight)
    @player.move

    @player.collect(@items)
  end
end
