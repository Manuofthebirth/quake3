require_relative "log_parser" 
require_relative "game" 

class Player
  MATCHER = /\s(?<id>\d)\sn\\(?<name>\w.+)\\t/ # players_info

  attr_reader :id
  attr_accessor :name, :kills

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @kills = 0
  end

  def kill(player)
    if @id.eql?(1022) # World id = 1022 ; When <world> kill the player, the player lose -1 kill score.
      player.kills -=1
    else
      player.kills += 1 unless @id.eql?(player.id)      
    end
  end
end

