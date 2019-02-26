require_relative "log_parser" 
require_relative "game" 
require_relative "player" 

parsing = LogParser.new(File.open('test/qgames.log').read) # open file
task2 = Game.new(parsing.games) # separate games into arrays
puts ' '
puts 'Generating all games results..'
puts ' '
puts task2.games_results
