require_relative "player" 
require_relative "game" 

# Opening log file
# readlines() will return an array of all of the lines

class LogParser
	def self.read_file
		File.open("one_game.log", "r") do |file|
			file.readlines()
		end
	end

	def self.parse_log
		log_lines = LogParser.read_file
	end
end
