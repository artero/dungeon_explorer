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
    tiles.each { |row| row.each { |tile| tile.draw(window) } }
  end

  def click_on(x, y)
    puts "- x: #{x}, y: #{y} - Tile: #{(x/Tile.size).to_i}, #{(y/Tile.size).to_i} "
    tiles[(y/Tile.size).to_i][(x/Tile.size).to_i].on_click
  end

  private

  def initialize_tiles
    m = 0
    size_y.times do
      n = 0
      tiles[m] = []
      size_x.times do
        tiles[m] << Tile.new(n * tile_size, m * tile_size)
        n += 1
      end
      m += 1
    end
    @tiles
  end

  def tile_size
    Tile.size + line_size
  end
end
