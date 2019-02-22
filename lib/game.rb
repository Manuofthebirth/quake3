require_relative "log_parser" 
require_relative "player" 
require 'json'

class Game
	attr_reader :id
	attr_accessor :players, :total_kills, :kill_by_means
	# include LogParser

	def initialize(game_log_text)
		@id = id
		@players = {}
		@total_kills = 0
		@kills_by_means = []
	end

	def self.player_info
		# :player_id >> |space| |id| |1 or more digits| |space| |n\|
		# :player_name >> |n\| |name| |ranges from words and spaces| |\t|
		games.scan(Player::MATCHER).uniq
		@players = player_info
	end

	def self.kill_info
		# :killer_id >> |space| |id| |1 or more digits| |space| 
		# :killed_id >> |space| |id| |1 or more digits| |any char|
		# :mean_of_death_id >> |space| |id| |1 or more digits| |any char|
		# :mean_of_death >> |mean| |every char from MOD until end of line|
	    games.scan(/\s(?<killer_id>\d+)\s(?<killed_id>\d+)\s(?<mean_of_death_id>\d+).+(?<mean_of_death>MOD\w+)/)
    end

  #   def game_stats
		# JSON.parse('game { "total_kills": => @total_kills, "player_name": }')
  #   end
end

