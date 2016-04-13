class Room

  attr_reader :description, :exits
  def initialize(description, exits = [])
    @description = description
    @exits = exits
  end

  def leave_room(direction)
     @exits.include?(direction)
  end

end
