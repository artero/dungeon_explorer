class Map
  attr_reader :size_x, :size_y, :line_size, :tiles

  def initialize(**options)
    @size_x = options[:size_x] || 10
    @size_y = options[:size_y] || 10
    @line_size = options[:line_size] || 1
    @tiles = []
    initialize_tiles
  end

  def draw(window)
    tiles.each { |row| row.each { |tile| tile.draw } }
  end

  def click_on(x, y)
    puts "- x: #{x}, y: #{y} - Tile: #{(x/Tile.size).to_i}, #{(y/Tile.size).to_i} "
    tiles[(x/Tile.size).to_i][(y/Tile.size).to_i].on_click
  end

  private

  def initialize_tiles
    x_i = 0
    size_x.times do
      y_i = 0
      tiles[x_i] = []
      size_y.times do
        tiles[x_i] << Tile.new(x_i * tile_size, y_i * tile_size)
        y_i += 1
      end
      x_i += 1
    end
    @tiles
  end

  def tile_size
    Tile.size + line_size
  end
end
