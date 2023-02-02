def merge_sort(array)
    # sorts a list in ascending order; 
    # Divide: find the midpoint of the list and divide in sublits 
    # Conquer: recursively sort the sublists created previously
    # Combine: merge the sorted lists created previously

    return array if array.size <= 1 

    mid = array.size / 2
    left = array[0, mid]
    right = array[mid, array.size - mid]

    merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
    result = []
    i = 0
    j = 0 

    while i < left.size && j < right.size 
        if left[i] <= right[j]
            result << left[i]
            i += 1 
        else
            result << right[j]
            j += 1 
        end
    end
    result + left[i, left.size] + right[j, right.size]
end

array = [5, 2, 4, 2, 0, 8, 6, 9, 11]
sorted_array = merge_sort(array)
puts sorted_array