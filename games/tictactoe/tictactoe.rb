# Algorithm
	# Player puts the name
	# Empty board is displayed
	# Game prompts and asks where is the next movement
		# It checks if cell is empty 
		# If the cell is not empty, fill it
		# Then checks if the player wins
		# Turn of next person
	# Displays who wins or if it is a tie

# Has all the game logic
class Game
	attr_reader :board, :p1, :p2

	# Creates the players and the grid
	def initialize
		@board = Board.new
		@p1 = Player.new
		@p2 = Player.new
	end

	# Prints players data
	def players_data
		puts @p1.data
		puts @p2.data
	end


	# Holds data for the players
	class Player
		attr_reader :name, :sym
		@@players = 0
		@@symbols = ['X','O']

		# Initializer
		def initialize()
			@@players += 1
			puts 'Enter player ' + @@players.to_s + ' name'
			@name = gets.chomp
			@sym = @@symbols[@@players-1]
		end

		# Players data
		def data
			puts 'Hi ' + @name + '. Symbol: ' + @sym
		end
	end


	# Create, displays and updates the grid
	class Board
		attr_reader :board, :empty_cell

		# Creates empty 3*3 grid
		def initialize
			@empty_cell = '_'
			@board = Array.new(3) {Array.new(3,@empty_cell)}
		end

		# Prints the grid
		def print_grid
			line_number = 0
			@board.each { |row|
	      row.each { |cell| print cell + " " }
	      puts ''
			}
			puts ' '
		end

		#Updates the cell
		def update(row, cell, sym)
			if @board[row][cell] != @empty_cell
				puts "This cell has something, try again!"
				return false
			else	
				@board[row][cell] = sym
				return true
			end
		end

	end
end

a = Game.new
a.players_data
