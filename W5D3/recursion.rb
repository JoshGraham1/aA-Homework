def range(start, end_point)
    return [] if end_point <= start
    [start] + range(start + 1, end_point)
end

# p range(1, 3)
# p range(1, 6)
# p range(2, 2)
# p range(5, 20)

def sum_array(arr)
    sum = 0
    arr.each do |num|
        sum += num
    end
    sum
end

# p sum_array([1,2,3,4,5,6])

def sum_array_recursive(arr)
    return [] if arr.empty?
    return arr[0] if arr.length == 1
    arr[0] + sum_array_recursive(arr[1..-1]) 
end

# p sum_array_recursive([])

def exponentiation_1(b, n) 
    return 1 if n == 0
    b * exponentiation_1(b, n - 1)
end

# include negative numbers
# p exponentiation_1(2, 1)

def exponentiation_2(b, n)
    return 1 if n == 0
    return b if n == 1
    if n.even?
        (exponentiation_2(b, n/2))**2
    elsif n.odd?
        b * (exponentiation_2(b, (n - 1) / 2) ** 2)
    end
end

# p exponentiation_2(2, 7)
# p exponentiation_2(2, 1)
# p exponentiation_2(2, 0)
# 9 stacks deep if n == 256

robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]

robot_parts_copy = robot_parts.dup

robot_parts_copy[1] << "LEDs"
# but it does
# p robot_parts[1][1].object_id
# p robot_parts_copy[1][1].object_id

def deep_dup(arr)
    new_arr = []
    arr.each do |sub_array|
        if !sub_array.is_a?(Array)
            new_arr << sub_array
        else
            new_arr << deep_dup(sub_array)
        end
    end
    new_arr
end

# p deep_dup([1, [2], [3, [4]]])

def fib_it(n) 
    fib = [0, 1]
    until fib.length == n
        fib << fib[-1] + fib[-2]
    end
    fib
end

def fib_rec(n)
    return [0, 1].take(n) if n <= 2
    fib_rec(n - 1) << fib_rec(n - 1)[-1] + fib_rec(n - 1)[-2]
end

# p fib_rec(5)

def binary_search(array, target) #target = 3
    return nil if array.length == 0
    mid_idx = array.length / 2
    left = array[0...mid_idx]
    right = array[mid_idx + 1..-1]
    if target < array[mid_idx]
        binary_search(left, target)
    elsif target > array[mid_idx]
        result = binary_search(right, target)
        return nil if result.nil?
        mid_idx + result + 1
    else # mid_idx = target
        return mid_idx
    end
end

# p binary_search([1, 2, 3], 1) # => 0
# p binary_search([2, 3, 4, 5], 3) # => 1
# p binary_search([2, 4, 6, 8, 10], 6) # => 2
# p binary_search([1, 3, 4, 5, 9], 5) # => 3
# p binary_search([1, 2, 3, 4, 5, 6], 6) # => 5
# p binary_search([1, 2, 3, 4, 5, 6], 0) # => nil
# p binary_search([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(array)
    return array if array.length == 1
    mid_idx = array.length / 2
    left = array[0...mid_idx]
    right = array[mid_idx..-1]
    sorted_left = merge_sort(left) 
    sorted_right = merge_sort(right)
    merge(sorted_left, sorted_right)
end

def merge(a, b) 
    results = []
    until a.empty? || b.empty? 
        if a[0] > b[0]
            results << b.shift
        else 
            results << a.shift
        end
    end
    results + a + b
end

p merge_sort([38,27,43,3,9,82,10])

def array_subsets(array)
    return [[]] if array.empty?
    elements = []
    duplicate = array.dup
    duplicate.each do |sub_array|
        sub_array << array.last
    end
    array_subsets(array[0...-1]) + duplicate
end

p array_subsets([]) # => [[]]
p array_subsets([1]) # => [[], [1]]
# subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]