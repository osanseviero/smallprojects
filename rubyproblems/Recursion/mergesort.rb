class MergeSort
    def sort(to_sort)
        # if the array is of length 0 or 1, consider it is already sorted
        if to_sort.length <= 1
            then return to_sort 
        end
         
        # otherwise split the remaining elements in two
        second_array = to_sort.slice!((to_sort.length / 2.0).round..to_sort.length)
                 
        # recursive method call on both arrays
        first_sorted_array = sort(to_sort)
        second_sorted_array = sort(second_array)
         
        # merge the two sorted arrays together
        return merge(first_sorted_array, second_sorted_array)
    end
     
private
    def merge(first_array, second_array)
        # if either array is empty consider the other already sorted
        return second_array if first_array.empty?
        return first_array if second_array.empty?
         
        # remove the smallest element out of the two arrays
        if first_array.first <= second_array.first 
            element = first_array.shift
        else
            element = second_array.shift
        end    
     
        # recursive call to construct the merged array  
        return [element] + merge(first_array, second_array)
    end
end

merge_sort = MergeSort.new
puts merge_sort.sort([3,8,2,1,102,10,3])