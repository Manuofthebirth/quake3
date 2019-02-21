require_relative "log_parser" 

class Player

	attr_reader :id, 
	attr_accessor :name, :kills

	def initialize(id, name)
		@id = id
		@name = name
		@kills = 0
	end

	def kill(player)
		if @id.eql?(1022) # World id = 1022 ; When <world> kill the player, the player lose -1 kill score.
			@kills -=1
		else
			player.kills += 1 unless @id.eql?(player.id)			
		end
	end
end