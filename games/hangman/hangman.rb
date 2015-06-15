require 'yaml'

class Hangman
	attr_accessor :secret_word, :guess_word, :character_count, :turns, :win

	# Selects the random wors
	def initialize
		@win = false
		select_word
		start
		turns
	end

	# Selects a random word from dictionary
	def select_word
		dictionary = File.open('dictionary.txt','r')
		
		words = []
		dictionary.each{ |word|
			if word.length > 5 && word.length < 12
				words << word.downcase	
			end
		}
		words.shuffle!
		@secret_word = words[0]
	end

	# Some data
	def start
		@character_count = @secret_word.length - 1
		@guess_word = ''
		@character_count.times { @guess_word += '_' }
		@turns = 10
	end

	# Main game logic
	def turns
		while @turns > 0
			print_data
			guess_letter
			break if @win == true
		end
		finish
	end

	def save_game
		save_data = YAML::dump(self)
		File.open("saved.yaml","w"){ |file| file.write(save_data) }
	end

	def load_game
		yaml = "saved.yaml"
		if File.exists? yaml
			load = YAML::load_file(yaml)
			return load.turns
		end
		
		puts "Invalid file name.\n\n"
		return menu_control
	end


	def print_data
		puts @guess_word + " Number of characters: " + @character_count.to_s
		puts "You have " + @turns.to_s + " left."
	end

	def guess_letter
		puts "Enter one character (or 1 if you want to save, 2 to load an old game)"
		a = false
		guess = gets.chomp.downcase
		if guess == '1'
			save_game
		elsif guess == '2'
				load_game
		else
			while !a		
				if guess.length > 1 || guess.empty?
					puts "There are too much (or no) letters. Just enter one!"
					guess = gets.chomp.downcase
				else
					a = true
				end
				check_letter(guess)
			end
		end	
	end

	def check_letter(guess)
		@turns -= 1
		if @secret_word.include? guess
			puts "The letter is there!"
			@secret_word.split("").each_with_index{ |letter, index|
				if letter == guess
					@guess_word[index] = guess
					check_win
				end
			}
		else
			puts "Sorry, you failed"
		end
	end
	
	def check_win
		if @secret_word.include?(@guess_word)
			@win = true
		end
	end

	def finish
		puts "The word was " + @secret_word +"!"
		if @win
			puts "You won!"
		else
			puts "You have no turns left. You lost!"
		end
	end

end


a = Hangman.new