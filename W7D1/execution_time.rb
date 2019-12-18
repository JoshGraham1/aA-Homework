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
  current_max = 0
  current_sum = 0
  greatest_element = false
  list.each do |element|
    if element + current_sum >= 0
      current_sum += element
      current_max = current_sum if current_sum > current_max 
    else
      current_sum = 0
    end
    greatest_element = element if !greatest_element || element > greatest_element
  end
  if current_max == 0
    greatest_element
  else
    current_max
  end
end

list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])
