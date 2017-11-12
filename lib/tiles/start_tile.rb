class StartTile < Tile
  alias initial_status deactive
  def deactive_image
    'asets/images/tile_start.png'
  end
end
