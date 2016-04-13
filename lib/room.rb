class Room

  attr_reader :description, :exits
  def initialize(description, exits = [])
    @description = description
    @exits = exits
  end

  def leave_room(direction)
    message = "there is no way of leaving in this direction"
    raise message unless @exits.include(direction)
  end

end
