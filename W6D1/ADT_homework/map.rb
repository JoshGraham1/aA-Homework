class Map

    attr_reader :my_map

    def initialize
        @my_map = []
    end

    def set(key, val)
        if self.has_key?(key) && self.valid_set?([key, val])
            puts "Key already exists"
        else 
            self.my_map << [key, val]
        end
    end

    def valid_set?(arr)
        return false unless arr.is-a? Array
        if arr.length > 2 || arr.length < 2
            return false
        end
    end

    def has_key?(key)
        self.my_map.each do |set|
            map_key = set[0]
            if map_key == key
                return true
            end
        end
        false
    end

    def get(key)
        self.my_map.each do |set|
            map_key = set[0]
            if map_key == key
                return set
            end
        end
        puts "Key does not exist"
    end

    def delete(key)
        self.my_map.each do |set|
            map_key = set[0]
            if map_key == key
                self.my_map.delete(set)
                puts "Key has been deleted"
            end
        end
        puts "Key does not exist"
    end

    def display
        puts self.my_map
    end

end