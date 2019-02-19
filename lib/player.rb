require_relative "log_parser" 

class Player

	attr_reader :id, :name
	attr_accessor :kills, :score

	def initialize(id, name, score, kills)
		@id = id
		@name = name
		@score = 0
		@kills = 0
	end
end