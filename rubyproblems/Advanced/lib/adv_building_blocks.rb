# Reference to problems: http://www.theodinproject.com/ruby-programming/advanced-building-blocks?ref=lnav

def bubble_sort(arr)
	size = arr.length
	swap = true
	while swap
		idx = 0
		swap = false
		while idx < size-1
			if arr[idx] > arr[idx+1]
				arr[idx], arr[idx+1] = arr[idx+1], arr[idx]
				swap = true
			end
			idx += 1
		end		
	end
	return arr
end

def bubble_sort_by(arr) 
	size = arr.length
	swap = true
	while swap
		idx = 0
		swap = false
		while idx < size-1
			check_block = yield(arr[idx], arr[idx+1])
			if check_block < 0
				arr[idx], arr[idx+1] = arr[idx+1], arr[idx]
				swap = true
			end
			idx += 1
		end		
	end
	return arr
end










