require_relative "log_parser" 

class Player

	attr_reader :id
	attr_accessor :name, :kills, :score

	def initialize(id, name, kills, score)
		@id = id
		@name = name
		@kills = 0
		@score = 0
	end
end