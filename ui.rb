class UI
  SCORE_X = 10
  SCORE_Y = 10
  SCORE_COLOR = 0xff_ffff00

  LIVES_X = 10
  LIVES_X_SHIFT = 20
  LIVES_Y = 30

  def initialize
    @font = Gosu::Font.new(20, name: "assets/fonts/VT323/VT323-Regular.ttf")
    @heart = Gosu::Image.new("assets/images/heart.gif")
  end

  def draw(player)
    draw_score(player.score)
    draw_lives(player.lives)
  end

  private

  def draw_score(score)
    @font.draw("Score: #{score}", SCORE_X, SCORE_Y, ZOrder::UI, 1.0, 1.0, SCORE_COLOR)
  end

  def draw_lives(number)
    number.times do |index|
      @heart.draw(LIVES_X_SHIFT * index + LIVES_X, LIVES_Y, ZOrder::UI)
    end
  end
end
