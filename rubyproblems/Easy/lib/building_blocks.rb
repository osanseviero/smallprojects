def caesar_cipher(str, places)
	vocabulary = [*"A".."Z"] * 2 + [*"a".."z"] * 2 		#We use splat operator for array coercion
	result = ""
	size = str.length
	idx = 0
	while idx<size
		if !vocabulary.include?(str[idx])
			result += str[idx]
			idx +=1
		else
			place = vocabulary.index(str[idx])
			result = result + vocabulary[place + places%26]
			idx += 1
		end
	end
	return result
end


def stock_picker(arr)
	# Take every day as a buy day
		# Then check biggest number from that number as selling day, and pick biggest one
		# Compare Winning
		# If bigger than upper answer, keep it
	win = 0
	buy = 0
	sell = 0
	arr.each.with_index { |buy_value, index|
		biggest_sell = 0 																			#We reset for the new sell
		arr.each.with_index{ |sell_value, index2|
			if (index2 > index) && (sell_value > biggest_sell)	#We just sell after we buy, so i2 > i. Here we check biggest sell
				biggest_sell = sell_value
			end
		}
		if win < biggest_sell - buy_value
			buy = buy_value
			sell = biggest_sell
			win = biggest_sell - buy_value
		end
	}
	return [arr.index(buy),arr.index(sell)]
end

def substrings(word,dictionary)
	# Create every word possible from a word and compare with dictionary
	result = Hash.new(0)
	temp_word = ''
	word.each_char { |char|
		temp_word += char
		if dictionary.include? temp_word
			result[temp_word] += 1
		end
	}

	return result
end








# Problems: http://www.theodinproject.com/ruby-programming/building-blocks?ref=lnav
# The splat operator: https://endofline.wordpress.com/2011/01/21/the-strange-ruby-splat/