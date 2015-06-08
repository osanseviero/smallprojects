def caesar_cipher(str, places)
	vocabulary = "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxy"
	result = ""
	size = str.length
	idx = 0
	while idx<size
		if !vocabulary.include?(str[idx])
			result += str[idx]
			idx +=1
		else
			place = vocabulary.index(str[idx])
			result = result + vocabulary[place + places]
			idx += 1
		end
	end
	return result
end

puts caesar_cipher("What a toaster!",20)