class Map
  attr_reader :size_x, :size_y, :tiles

  def initialize(**options)
    @size_x = options[:size_x] || 10
    @size_y = options[:size_y] || 10
    @tiles = []
    initialize_tiles
  end

  def draw
    tiles.each(&:draw)
  end

  def update
    tiles.each(&:update)
  end

  def click_on(x, y)
    tiles[tile_num(x, y)].actioning
  end


  private

  def tile_num(x, y)
    pos_x = (x / tile_size).to_i
    pos_y = (y / tile_size).to_i

    # puts "- x: #{x}, y: #{y} - Tile: #{tile_position} => (#{pos_x}, #{pos_y}))"
    pos_x + ((pos_y % size_y) * size_x)
  end

  def initialize_tiles
    y_i = 0
    size_y.times do
      x_i = 0
      size_x.times do
        tiles << Tile.new(x_i * tile_size, y_i * tile_size)
        x_i += 1
      end
      y_i += 1
    end
    @tiles
  end

  def tile_size
    Tile.size
  end
end
