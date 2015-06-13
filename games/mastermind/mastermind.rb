# A code from ['R','G','B','Y','W','B'] without repeating will be randomly generated
# The computer will tell how many are at the correct place, how many colors are correct and how many are wrong
# The game ends at turn 12 or when player code is the correct one

# Holds all the game logic
class Game
	attr_accessor :code

	def initialize
		generateCode
		#Player guess code
		# Computer compares and gives results
	end

	def generateCode
		options = ['R','G','B','Y','W','Bl']
		@code = options.sample(4)
		puts @code
	end

end

a = Game.new