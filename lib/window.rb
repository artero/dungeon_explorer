class Window < Gosu::Window
  WITHD = 640
  HEIGHT = 480

  def initialize
    super WITHD, HEIGHT
    self.caption = 'Game'

    map_code = [
      [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 0, 2, 0, 1, 0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1, 0, 0, 1, 0, 1],
      [1, 0, 0, 0, 0, 0, 0, 1, 0, 1],
      [1, 0, 0, 0, 1, 1, 1, 0, 0, 1],
      [1, 0, 0, 0, 1, 3, 0, 0, 0, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
    ]

    @map = Map.new map_code: map_code
  end

  def update
    @map.update
  end

  def draw
    @map.draw
  end

  def button_down (id)
    case id
    when Gosu::MsLeft
      puts 'Left Click:'
      @map.click_on(mouse_x, mouse_y)
    end
  end

  def needs_cursor?
    true
  end
end