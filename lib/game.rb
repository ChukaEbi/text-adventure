require 'yaml'
require_relative 'player.rb'
require_relative 'world.rb'

class Game
  DIRECTIONS = [:north, :east, :south, :west]

  attr_reader :messages, :room

  def initialize(message = YAML.load_file("assets/messages.yml"))
    @messages = message['messages']
    @world = World.new
    @person = Player.new
  end

  def start_game
    puts @messages['beginning']
    @world.create_rooms
    current_room = @world.rooms[0]
    i = 1
    while(i < @world.rooms.length)
      puts current_room.description
      action = player_input
      take_direction(action)
      i+=1
    end
    puts @messages['end']
  end

  def player_input
    puts 'What do you want to do'
    action = gets.chomp.to_sym
  end

  def take_direction(direction)
    @world.go_north(@person, @current_room) if direction == :north
    @world.go_south(@person, @current_room) if direction == :south
    @world.go_east(@person, @current_room) if direction == :east
    @world.go_west(@person, @current_room) if direction == :west
  end

  def  player_position
    "You are at [#{@player.x_position}, #{@player.y_position}]"
  end
end
