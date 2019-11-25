require "byebug"
def my_min(array)
  smallest = false
  array.each do |element|
    smallest = element if !smallest || element < smallest
  end
  smallest
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

# def largest_contiguous_subsum(list)
#   sub_arrays = []
#   (0...list.length).each do |i|
#     (i...list.length).each do |j|
#       sub_arrays << list[i..j]
#     end
#   end
#   sub_arrays.inject do |acc, sub_array|
#     if sub_array.sum > acc.sum
#       sub_array
#     else
#       acc
#     end
#   end.sum
# end

def largest_contiguous_subsum(list)
  max_sum = list.max
  start_idx = 0
  last_idx = 0
  while start_idx < list.length
    if list[start_idx..last_idx].sum > max_sum
      max_sum = list[start_idx..last_idx].sum
    end
    if last_idx == list.length
      start_idx += 1
      last_idx = start_idx
    end
    last_idx += 1
  end
  max_sum
end

# p largest_contiguous_subsum([ 0, 3, 5, 4, -5, 10, 1, 90 ])

list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])