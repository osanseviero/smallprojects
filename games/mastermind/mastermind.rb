# A code from ['R','G','B','Y','W','B'] without repeating will be randomly generated
# The computer will tell how many are at the correct place, how many colors are correct and how many are wrong
# The game ends at turn 12 or when player code is the correct one

# Holds all the game logic
class Game
	attr_accessor :code, :guess, :turns

	def initialize
		userplay
	end

	
	# When the user guess the code
	def userplay
		@win = false
		generateCode
		@turns = 4
		while (!@win) && (@turns > 0)
			pguessCode
			checkGuess
		end
		endGame
	end

	# Computer generates a random code
	def generateCode
		options = ['R','G','B','Y','W','BL']
		@code = options.sample(4)
		puts @code
	end

	# Player guess the code
	def pguessCode
		puts "The options are: R/G/B/Y/W/BL"
		counter = 1
		@guess = []
		4.times {
			puts "Enter color at position #{counter}"
			input = gets.chomp
			guess << input
			counter +=1
		}
	end

	# Computer checks the code
	def checkGuess
		correct = 0
		position = 0
		guess.each_with_index{ |element, index|
			if element == code[index]
				correct += 1
			elsif code.include?(element)
				position += 1
			end
		}
		puts "Correct position " + correct.to_s
		puts "Color in wrong position " + position.to_s 
		@win = true if correct == 4
		if !@win 
			@turns -= 1
			puts "There are " + @turns.to_s + " turns left."
		end
	end

	def endGame
		if @win
			puts "You won the game"
		else
			puts "You lost the game"
		end
		puts "Do you want to play agan (y/n)"
		repeat = gets.chomp
		if repeat == 'y'
			userplay
		else
			puts "Bye bye :)"
		end
	end

end

a = Game.new