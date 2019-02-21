require_relative "log_parser" 
require_relative "player" 

class Game
	attr_reader :id
	attr_accessor :players, :total_kills, :kill_by_means, :start_time, :end_time

	def initialize(id, players, total_kills, kills_by_means)
		@id = id
		@players = []
		@total_kills = 0
		@kills_by_means = {}
		@start_time = start_time
		@end_time = end_time
	end

	def self.start_info(line)
		# :start_time >> time |1 or more digits| : |2 digits| |any char| |bf text|
		line.match(/?<start_time>\d{1,}:\d{2}).+(?<=InitGame:\)
	end

	def self.end_info(line)
		# :end_time >> time |1 or more digits| : |2 digits| |any char| |bf text|
		line.match(/?<end_time>\d{1,}:\d{2}).+(?<=ShutdownGame:\)
	end

	def self.player_info(line)
		# :player_id >> |space| |id| |1 or more digits| |space| |n\|
		# :player_name >> |n\| |name| |range from words and spaces| |\t|
		line.match(/\s(?<player_id>\d)\sn\\(?<player_name>\w.+)\\t/).uniq
	end

	def self.kill_info(line)
		# :killer_id >> |space| |id| |1 or more digits| |space| 
		# :killed_id >> |space| |id| |1 or more digits| |any char|
		# :mean_of_death_id >> |space| |id| |1 or more digits| |any char|
		# :mean_of_death >> |mean| |every char from MOD until end of line|
	    line.match(/\s(?<killer_id>\d+)\s(?<killed_id>\d+)\s(?<mean_of_death_id>\d+).+(?<mean_of_death>MOD\w+)/)
    end
end

  