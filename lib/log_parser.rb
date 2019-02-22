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

	# def self.read_file
	# 	File.open("qgames.log", "r") do |file|
	# 		file.readlines()
	# 	end
	# end

	# def self.parse_log
	# 	log_lines = LogParser.read_file
	# end
end
