require 'rubygems'
require 'bundler'
Bundler.require(:default)

require_relative 'lib/tile'
require_relative 'lib/map'

class Game < Gosu::Window
  WITHD = 640
  HEIGHT = 480

  def initialize
    super WITHD, HEIGHT
    self.caption = "Gosu Tutorial Game"

    @map = Map.new size_x: 9,
                   size_y: 7
  end

  def update
    # ...
  end

  def draw
    @map.draw(self)
  end

  def needs_cursor?
    true
  end
end

Game.new.show
