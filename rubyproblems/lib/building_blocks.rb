def caesar_cipher(str, places)
	vocabulary = [*"A".."Z"] * 2 + [*"a".."z"] * 2
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
