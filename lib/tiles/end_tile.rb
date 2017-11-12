class EndTile < Tile
  alias initial_status forget
  def deactive_image
    'asets/images/tile_end.png'
  end

  def active
    super
    finish_level
  end

  def finish_level
    puts 'Finish Level'
  end
end
