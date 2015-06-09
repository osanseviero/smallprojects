def bubble_sort(arr)
	size = arr.length
	(size-1).times{
		idx = 0
		while idx < size-1
			if arr[idx] > arr[idx+1]
				arr[idx], arr[idx+1] = arr[idx+1], arr[idx]
			end
			idx += 1
		end		
	}
	return arr
end