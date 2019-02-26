require_relative "log_parser" 
require_relative "game" 
require_relative "player" 

parsing = LogParser.new(File.open('test/qgames.log').read) # open file
task1 = Game.new(parsing.games) # array of games
puts ' '
puts 'Generating a random game results..'
puts ' '
puts task1.games_results.to_a.sample(1).to_h # will convert a hash to an array, then randomize it before converting back