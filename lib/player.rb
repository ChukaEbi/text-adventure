class Player

  attr_reader :x_position, :y_position

  def initialize
    @x_position = 0
    @y_position = 0
  end

  def move_north
    @y_position += 1
  end

  def move_south
    @y_position -= 1
  end

  def move_east
    @x_position += 1
  end

  def move_west
    @x_position -= 1
  end

end
