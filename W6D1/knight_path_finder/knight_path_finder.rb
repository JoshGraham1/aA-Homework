require_relative "poly_tree_node"

class KnightPathFinder

    attr_reader :root_node

    POS_CHANGES = [[2, -1], [1, 2], [2, 1], [-1, 2], [-2, -1], [-2, 1], [1, -2], [-1, -2]]

    def self.root_node(start_pos)
        PolyTreeNode.new(start_pos)
    end

    def initialize(start_pos)
        @start_pos = start_pos
        @root_node = KnightPathFinder.root_node(@start_pos)
    end

    def build_move_tree
        #self.root_node = PolyTreeNode.new(@start_pos)
        range = (0...8).to_a
        queue = [@root_node]
        until queue.empty?
            parent = queue.shift
            all_moves = POS_CHANGES.map { |pos| [parent.value[0] + pos[0], parent.value[1] + pos[1]] }
            valid_moves = all_moves.select { | pos | range.include?(pos[0]) && range.include?(pos[1]) && pos != parent.value }
            valid_moves.each do |move|
                child = PolyTreeNode.new(move)
                parent.add_child(child)
                queue << child
            end
            p queue
        end
    end
end

finder = KnightPathFinder.new([0, 0])
p finder.build_move_tree


# changed = [[-1, 0], [0, 0], [2, 3], [9, 9]]
# range = (0...8).to_a
# changed.select { | pos | }