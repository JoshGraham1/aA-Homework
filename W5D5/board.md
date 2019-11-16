### Binary Search
Write a method that binary searches an array for a target and returns its
index if found. Assume a sorted array.
NB: YOU MUST WRITE THIS RECURSIVELY (searching half of the array every time).
We will not give you points if you visit every element in the array every time
you search.
For example, given the array [1, 2, 3, 4], you should NOT be checking
1 first, then 2, then 3, then 4.

def binary_search(arr, target)
    return nil if arr.empty?
    mid_idx = arr.length / 2
    left = arr[0..mid_idx]
    right = arr[mid_idx + 1..-1]

    case arr[mid_idx] <==> target 
    when 0
    return mid_idx
    when -1
    binary_search(left, target)
    when 1
    binary_search(right, target)
    end
end

## Monkey Patching
### my_each
Write a method that calls a passed block for each element of the array

class Array

    def my_each(&prc)
        i = 0
        until i == self.length
            prc.call(self[i])
            i += 1
        end
    end
end

### dups
Write an array method that returns a hash where the keys are any element
that appears in the array more than once, and the values are sorted arrays
of indices for those elements.

class Array
 
    def dups
        subs = Hash.new { |h, k| h[k] = [] }
        self.each_with_index do |el, i|
            subs[el] << i
        end
        subs.select { |k, v| v.length > 1 }
    end
end

