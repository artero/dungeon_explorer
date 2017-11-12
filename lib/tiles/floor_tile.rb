class FloorTile < Tile
  alias initial_status forget
  def deactive_image
    'asets/images/tile_basic.png'
  end
end