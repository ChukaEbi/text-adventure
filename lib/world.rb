require_relative 'room.rb'
require 'yaml'

class World

  attr_reader :rooms, :other_rooms
  WORLD_WIDTH = 5
  WORLD_HEIGHT = 5

  attr_reader :rooms

  def initialize(world_width = WORLD_WIDTH, world_height = WORLD_HEIGHT)
    @rooms = []
    @message = "You have fallen off the edge of the world and died"
  end

  def create_rooms
    load_start_room
    load_other_rooms
    load_final_room
  end

  def go_north(person)
    raise @message if person.y_position == WORLD_HEIGHT
    person.move_north if (person.y_position < WORLD_HEIGHT)
  end

  def go_south(person)
    raise @message if person.y_position == 0

    person.move_south if (person.y_position > 0)
  end

  def go_east(person)
    raise @message if person.x_position == WORLD_WIDTH
    person.move_east if (person.y_position < WORLD_WIDTH)
  end

  def go_west(person)
    raise @message if (person.x_position == 0)
    person.move_west if (person.y_position > 0)
  end

  private

  def load_start_room
    start_room = YAML.load_file("assets/rooms/starting_room.yml")
    create_room(start_room['starting_room'])
  end

  def load_final_room
    finish_room = YAML.load_file("assets/rooms/final_room.yml")
    create_room(finish_room["final_room"])
  end

  def load_other_rooms
    other_rooms = YAML.load_file("assets/rooms/other_rooms.yml")
    other_rooms.each{|room| create_room(room)}
  end

  def create_room(room)
    @rooms.push(Room.new(room['description'], room['exits']))
  end
end
