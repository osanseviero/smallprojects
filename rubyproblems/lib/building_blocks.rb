def caesar_cipher(str, places)
	vocabulary = [*"A".."Z"] * 2 + [*"a".."z"] * 2 		#We use splat operator for array coercion: 
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




# Problems: http://www.theodinproject.com/ruby-programming/building-blocks?ref=lnav
# The splat operator: https://endofline.wordpress.com/2011/01/21/the-strange-ruby-splat/