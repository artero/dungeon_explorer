class Tile
  SIZE = 64
  DEACTIVE_TIME = 300
  STATUS = %i[unknown inactive active].freeze

  attr_reader :x, :y, :color, :deactive_at, :status

  def initialize(x, y, options = {})
    @color = options[:color] || Gosu::Color::RED
    positioning_to(x, y)
    forget
  end

  def positioning_to(x, y)
    @x = x
    @y = y
  end

  def self.size
    SIZE
  end

  def draw(z = 1)
    @image.draw_rot(x + SIZE / 2, y + SIZE / 2, z, 0)
  end

  def update
    case status
    when :unknown
      nothing_to_do
    when :inactive
      nothing_to_do
    when :active
      deactive unless deactive_at
      deactive if deactive_at && Gosu.milliseconds > deactive_at
    end
  end

  def actioning
    case status
    when :inactive
      active
    when :unknown
      deactive
    when :active
      nothing_to_do
    end
  end

  private

  def active
    @deactive_at = Gosu.milliseconds + DEACTIVE_TIME
    @image = Gosu::Image.new('asets/images/tile_selected.png')
    @status = :active
    puts "set status to #{status} from #{Gosu.milliseconds} to #{deactive_at}"
  end

  def deactive
    @image = Gosu::Image.new('asets/images/tile_basic.png')
    @deactive_at = nil
    @status = :inactive
    puts "Set status to #{status} at #{Gosu.milliseconds}"
  end

  def forget
    @image = Gosu::Image.new('asets/images/tile_unknown.png')
    @status = :unknown
    puts "Set status to #{status} at #{Gosu.milliseconds}"
  end

  def nothing_to_do; end
end
