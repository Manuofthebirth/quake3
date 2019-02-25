require_relative "log_parser" 
require_relative "game" 

class Player

  attr_accessor :name, :kills

  def initialize(player)
    @name = player[:name]
    @kills = 0
  end

  def kill_counts(kill_event)
    Game.kill_events.each do |kill_event|
      if Game.kill_event[0] == player.name # <world> is not a player and should not appear in the list of players and even the kills in the dictionary.
        player.kills += 1 
      elsif Game.kill_event[0] == '<world>' && Game.kill_event[1] == player.name # When <world> kills the player, the player gains -1 kill score.
        player.kills -= 1 
      end
    end
  end

end