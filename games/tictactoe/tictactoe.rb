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
	@@player = 0


	# Creates the players and the grid
	def initialize
		@board = Board.new
		@p1 = Player.new
		@p2 = Player.new
		players_data
	end

	# Prints players data
	def players_data
		puts @p1.data
		puts @p2.data
	end

	# This is a turn
	def update

		@board.print_grid
		puts "What row do you want to update?"
		row = gets.chomp.to_i
		puts "What column do you want to update?"
		column = gets.chomp.to_i
		if @@player == 0
			@board.update(row, column, @p1.sym)
			@board.print_grid
			@board.checkWin('X')
		else
			@board.update(row, column, @p2.sym)
			@board.print_grid
			@board.checkWin('O')
		end
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
			check = false
			while !check
				if @board[row-1][cell-1] != @empty_cell
					puts "This cell has something, try again! Put another row and column"
					puts "What row do you want to update?"
					row = gets.chomp.to_i
					puts "What column do you want to update?"
					cell = gets.chomp.to_i
					check = false
				else	
					@board[row-1][cell-1] = sym
					check = true
				end
			end
		end

		# Checks if a player has won
		def checkWin(sym)
			if board[0].all? {|cell| cell.to_s == sym}
				puts "FINISH"
			else board[1].all? {|cell| cell.to_s == sym}
				puts "FINISH"
			else board[2].all? {|cell| cell.to_s == sym}
				puts "FINISH"
			end

		end

	end
end

a = Game.new
a.update
a.update
a.update
a.update
a.update
a.update
