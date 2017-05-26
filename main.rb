require 'gosu'

require_relative 'z_order'
require_relative 'player'
require_relative 'animal'
require_relative 'ui'
require_relative 'window'

WINDOW_WIDTH = 640
WINDOW_HEIGHT = 480

window = Window.new(WINDOW_WIDTH, WINDOW_HEIGHT)
window.show
