Fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

#Sluggish Octo
def find_fish_lengths_1
    longest = false
    (0...Fish.length - 1).each do |i|
        (0..Fish.length - 1).each do |i2|
            Fish[i] = first_fish
            Fish[i2] = next_fish
            longest = Fish[i] if Fish[i].length > fish[i2].length
        end
    end
    longest
end

#Dominant Octo

def octo_merge(arr, &prc)
    return arr if arr.length < 2
    prc ||= proc { |x, y| x <=> y }
    mid = arr.length / 2
    left = arr.take(mid)
    right = arr.drop(mid)

    sorted_left = octo_merge(left, &prc)
    sorted_right = octo_merge(right, &prc)

    sorted = merge(sorted_left, sorted_right, &prc)
    sorted.last
end

def merge(left, right, &prc)
    sorted = []
    until left.empty? || right.empty?
        if prc.call(left.first, right.first) == -1
            sorted << left.shift
        else
            sorted << right.shift
        end
    end
    sorted + left + right 
end

# p octo_merge(Fish.dup) { |x, y| x.length <=> y.length }

#Clever Octo

def clever
    longest = false
    Fish.each do |fish|
       longest = fish if !longest || fish.length > longest.length
    end
    longest
end

p clever