# Algorithm
	# Player puts the name
	# Empty board is displayed
	# Game prompts and asks where is the next movement
		# It checks if cell is empty 
		# If the cell is not empty, fill it
		# Then checks if the player wins
		# Turn of next person
	# Displays who wins or if it is a tie


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

board = Board.new
board.print_grid()	
board.update(1,1,'X')
board.print_grid()	
board.update(2,1,'X')
board.print_grid()	
