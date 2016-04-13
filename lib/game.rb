require 'yaml'
require_relative 'player.rb'
require_relative 'world.rb'

class Game
  DIRECTIONS = ["north", "east", "south", "west"]

  attr_reader :world, :player, :current_room

  def initialize
    @world = World.new
    @player = Player.new
    @current_room
  end

  def start_game
    message('beginning')
    @world.create_rooms
    play_game
    message('end')
  end

  def player_input
    puts 'Which way do you want to go?'
    gets.chomp!
  end

  def  player_position
    "You are at [#{@player.x_position}, #{@player.y_position}]"
  end

  private

  def play_game
    i = 0
    while(i < @world.rooms.length)
      @current_room = @world.rooms[i]
      puts @current_room.description
      if(i == @world.rooms.length - 1)
        i+=1
      else
        action = player_input
        take_direction(action)
        i+=1
      end
    end
  end

  def take_direction(direction)
    if(DIRECTIONS.include?(direction))
        if(@current_room.leave_room(direction))
          move_player(@player,direction)
        else
          puts 'There is no path there'
          take_direction(gets.chomp!)
        end
    else
      puts 'Please enter a valid direction'
      take_direction(gets.chomp!)
    end
  end

  def move_player(player,direction)
    @world.go_north(player) if direction == :north
    @world.go_south(player) if direction == :south
    @world.go_east(player) if direction == :east
    @world.go_west(player) if direction == :west
  end

  def message(screen_message)
    m = YAML.load_file("assets/messages.yml")
    puts m[screen_message]
  end
end
