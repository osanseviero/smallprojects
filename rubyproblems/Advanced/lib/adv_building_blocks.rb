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

end