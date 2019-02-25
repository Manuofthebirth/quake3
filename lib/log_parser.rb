require_relative "player" 
require_relative "game" 

# Opening log file

class LogParser
	attr_reader :raw_log
	
	def initialize(log_text)
		@raw_log = log_text
	end

	def game_logs
		# |start of line| |any char except line break| |stop at Init| |any char| |stop at Shut at end| |\multi-lines|
		raw_log.scan(/^[^\n]*?InitGame:.*?ShutdownGame:.*?$/m)
	end

	def games
		game_logs.map { |game_log| Game.new(game_log) } # will return an array with each game log
	end
end
