class Map
  attr_reader :size_x, :size_y, :tiles

  def initialize(**options)
    @size_x = options[:size_x] || 10
    @size_y = options[:size_y] || 10
    @tiles = []
    initialize_tiles
    generate_start_title
  end

  def draw
    tiles.each(&:draw)
  end

  def update
    tiles.each(&:update)
  end

  def click_on(x, y)
    pos_x = (x / tile_size).to_i
    pos_y = (y / tile_size).to_i

    if some_closed_know?(pos_x, pos_y)
      tile(pos_x, pos_y).actioning
    end
  end

  private

  def generate_start_title
    tiles.sample.active
  end

  def tile(pos_x, pos_y)
    # puts "- x: #{x}, y: #{y} - Tile: #{tile_position} => (#{pos_x}, #{pos_y}))"
    tiles[pos_x + ((pos_y % size_y) * size_x)]
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

  def some_closed_know?(pos_x, pos_y)
    tile(pos_x-1, pos_y)&.know? || tile(pos_x+1, pos_y)&.know? ||
      tile(pos_x, pos_y-1)&.know? || tile(pos_x, pos_y+1)&.know?
  end
end
