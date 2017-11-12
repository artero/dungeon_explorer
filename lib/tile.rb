class Tile
  SIZE = 64

  attr_reader :x, :y, :color

  def initialize(x, y, options = {})
    @color = options[:color] || Gosu::Color::RED
    @image = Gosu::Image.new('asets/images/tile_basic.png')
    positioning_to(x, y)
  end

  def positioning_to(x, y)
    @x = x
    @y = y
  end

  def self.size
    SIZE
  end

  def draw(z = 1)
    # window.draw_quad(
    #   x1, y1, color,
    #   x2, y2, color,
    #   x3, y3, color,
    #   x4, y4, color
    # )
    @image.draw_rot(x + SIZE / 2, y + SIZE / 2, z, 0)
  end

  def on_click
    @image = Gosu::Image.new('asets/images/tile_selected.png')
  end

  # private

  # # (x1, y1)             (x2, y2)
  # #     +-------------------+
  # #     |                   |
  # #     |       (x, y)      |
  # #     |         +         |
  # #     |                   |
  # #     +-------------------+
  # # (x4, y4)             (x3, y3)

  # def x1
  #   @x
  # end
  # alias x4 x1

  # def x2
  #   @x + SIZE
  # end
  # alias x3 x2

  # def y1
  #   @y
  # end
  # alias y2 y1

  # def y4
  #   @y + SIZE
  # end
  # alias y3 y4
end
