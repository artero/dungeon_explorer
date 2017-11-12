class WallTile < Tile
  alias initial_status forget
  def deactive_image
    'asets/images/tile_wall.png'
  end

  def know?
    false
  end

  def explorable?
    false
  end
end