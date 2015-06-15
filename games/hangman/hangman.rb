class Hangman
	attr_accessor :secret_word, :guess_word, :character_count, :turns, :win

	# Selects the random wors
	def initialize
		dictionary = File.open('dictionary.txt','r')
		@win = false
		words = []
		dictionary.each{ |word|
			if word.length > 5 && word.length < 12
				words << word.downcase	
			end
		}
		words.shuffle!
		@secret_word = words[0]
		puts @secret_word
		play
	end

	def play
		@character_count = @secret_word.length - 1
		@guess_word = ''
		@character_count.times { @guess_word += '_' }
		@turns = 10
		while @turns > 0
			print_data
			guess_letter
			@turns -= 1
			puts @win
			break if @win == true
		end
		finish
	end

	def print_data
		puts @guess_word + " Number of characters: " + @character_count.to_s
		puts "You have " + @turns.to_s + " left."
	end

	def guess_letter
		puts "Enter one character"
		a = false
		while !a
			guess = gets.chomp.downcase
			if guess.length > 1
				puts "There are too much letters. Just enter one!"
			else
				a = true
			end
		end
		check_letter(guess)
	end

	def check_letter(guess)
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
		puts @guess_word
		puts @secret_word
		if @guess_word == @secret_word
			@win = true
		end
	end

end


a = Hangman.new