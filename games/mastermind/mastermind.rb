# A code from ['R','G','B','Y','W','B'] without repeating will be randomly generated
# The computer will tell how many are at the correct place, how many colors are correct and how many are wrong
# The game ends at turn 12 or when player code is the correct one

# Holds all the game logic
class Game
	attr_accessor :code, :guess, :turns

	def initialize
		gameType
		
	end

	# Decided if user plays or computer plays
	def gameType
		puts "Do you want to guess (1) or create (2) the code"
		type = gets.chomp
		userPlay if type == '1'
		computerPlay if type == '2'
	end
	
	# When the user guess the code
	def userPlay
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
		#puts @code
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

	# Computer guess the code
	def computerPlay
		puts "The computer will guess the code"
		counter = 1
		@code = []
		options = ['R','G','B','Y','W','BL']
		puts "The options are: R/G/B/Y/W/BL"
		4.times {
			puts "Enter color at position #{counter}"
			input = gets.chomp
			@code << input
			counter +=1
		}
		puts "You code is " + @code.to_s
		@win = true
		4.times {
			guess = options.sample(4)
			puts "The computer guess " + guess.to_s
			if guess == code
				puts "The computer won"
				@win = false
			end
		}
		endGame
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
			gameType
		else
			puts "Bye bye :)"
		end
	end

end

a = Game.new