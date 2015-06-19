def fibs(n)
	arr = [0,1]

	return arr[0] if n == 0
	return arr if n == 1
	
	n -= 1	

	if n > 0
		until arr.length - 1 == n
			arr << (arr[-2] + arr[-1])
		end
	end
	return arr
end

puts fibs(10).to_s

def fibs_rec(n)
	result = []
	return 0 if n == 0
	return 1 if n == 1
	return fibs_rec(n-1) + fibs_rec(n-2)
end

10.times {|i| print fibs_rec(i).to_s + " "}
