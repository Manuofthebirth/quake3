require_relative "log_parser" 

# module Rules
# 	def self.start_game_rule
# 		/InitGame:/
# 	end


# 	def self.end_game_rule
# 		/------/
# 	end
# end


class Game
	# include Rules

	attr_reader :id
	attr_accessor :players, :total_kills, :kill_by_means, :start_time, :end_time

	def initialize(players, total_kills, kills_by_means)
		@players = []
		@total_kills = 0
		@kills_by_means = []
	end
end

  