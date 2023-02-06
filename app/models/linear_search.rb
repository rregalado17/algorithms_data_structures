class Linear_Search < ActiveRecord::Base

    def linear_search(array, key)
        i = 0
        
        while i < array.length
            if array[i] == key
                return "#{key} at index #{array.index(key)}"
            end
                i+=1
            end
        return -1
    end


end
