class Map
  attr_reader :size_x, :size_y, :tiles, :map_code

  def initialize(**options)
    @map_code = options[:map_code]
    @size_x = map_code[0].size
    @size_y = map_code.size
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
    pos_x = (x / tile_size).to_i
    pos_y = (y / tile_size).to_i

    return unless some_closed_know?(pos_x, pos_y) && !tile(pos_x, pos_y).know?
    tile(pos_x, pos_y).actioning

    return unless tile(pos_x, pos_y).explorable?
    neighbour_tiles(pos_x, pos_y).each(&:neighbour_activated)
  end

  def neighbour_tiles(pos_x, pos_y)
    neighbours = []
    neighbours << tile(pos_x - 1, pos_y - 1)
    neighbours << tile(pos_x - 1, pos_y)
    neighbours << tile(pos_x - 1, pos_y + 1)
    neighbours << tile(pos_x, pos_y - 1)
    neighbours << tile(pos_x, pos_y + 1)
    neighbours << tile(pos_x + 1, pos_y - 1)
    neighbours << tile(pos_x + 1, pos_y)
    neighbours << tile(pos_x + 1, pos_y + 1)
    neighbours.compact
  end

  def tile(pos_x, pos_y)
    # puts "- x: #{x}, y: #{y} - Tile: #{tile_position} => (#{pos_x}, #{pos_y}))"
    tiles[pos_x + ((pos_y % size_y) * size_x)]
  end

  private

  def initialize_tiles
    y_i = 0
    @map_code.each do |row|
      x_i = 0
      row.each do |code|
        tiles << tile_class(code).new(x_i * tile_size,
                                      y_i * tile_size,
                                      map: self)
        x_i += 1
      end
      y_i += 1
    end
    @tiles
  end

  def tile_class(code)
    case code
    when 0
      FloorTile
    when 1
      WallTile
    when 2
      StartTile
    when 3
      EndTile
    end
  end

  def tile_size
    Tile.size
  end

  def some_closed_know?(pos_x, pos_y)
    neighbour_tiles(pos_x, pos_y).map(&:know?).include?(true)
  end
end
