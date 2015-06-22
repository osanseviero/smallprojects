# Has all the game logic
class Game
	attr_reader :board, :p1, :p2
	@@player = 0
	@@turn = 0

	# Creates the players and the grid
	def initialize
		@board = Board.new
		
	end

	def create_players
		@p1 = Player.new
		@p2 = Player.new
	end

	# Prints players data
	def players_data
		puts @p1.data
		puts @p2.data
	end

	# This is the main game
	def play
		@board.print_grid
		do_break = false
		while !((@board.checkWin('X', @p1.name)) || (@board.checkWin('O', @p2.name)))
			player_turn
			if @@turn == 9
				do_break = true
			end
			break if do_break
		end
		finish
	end

	# Each players turn
	def player_turn
		@@turn += 1
		puts "It is the turn of player " + (@@player+1).to_s
		puts "What row do you want to update?"
		row = gets.chomp.to_i
		puts "What column do you want to update?"
		column = gets.chomp.to_i
		if @@player == 0
			@board.update(row, column, @p1.sym)
			@@player = 1
		else
			@board.update(row, column, @p2.sym)
			@@player = 0
		end

		@board.print_grid
	end

	# Winning or tie
	def finish
		if @@turn == 9
			puts "It was a tie D:"
		end
		puts 'Do you want to start again?(yes/no)'
		input = gets.chomp
		if (input == 'no')
			puts 'Bye bye'
		elsif (input == 'yes')
			puts 'Let\'s start again'
			@board = Board.new
			@@turn = 0
			play
		end
	end

	# Holds data for the players
	class Player
		attr_accessor :name, :sym
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
		def checkWin(sym, name)
			if board[0].all? {|cell| cell.to_s == sym}
				puts name + ' has won!'
				return true
			elsif board[1].all? {|cell| cell.to_s == sym} 
				puts name + ' has won!'
				return true
			elsif board[2].all? {|cell| cell.to_s == sym} 
				puts name + ' has won!'
				return true
			elsif board[0][0] == sym && board[1][0] == sym && board[2][0] == sym
				puts name + ' has won!'
				return true
			elsif board[0][1] == sym && board[1][1] == sym && board[2][1] == sym
				puts name + ' has won!'
				return true
			elsif board[0][2] == sym && board[1][2] == sym && board[2][2] == sym
				puts name + ' has won!'
				return true
			elsif board[0][0] == sym && board[1][1] == sym && board[2][2] == sym
				puts name + ' has won!'
				return true
			elsif board[0][2] == sym && board[1][1] == sym && board[2][0] == sym
				puts name + ' has won!'
				return true
			end

		end

	end
end
