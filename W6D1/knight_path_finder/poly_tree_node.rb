class PolyTreeNode
    attr_reader :value, :parent, :children

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(node)
        self.parent.children.delete(self) if !(self.parent.nil?)
        @parent = node 
        return if node.nil?  
        node.children << self if !(node.children.include?(self))
    end

    def add_child(child_node)
        @children << child_node
        child_node.parent = self
    end

    def remove_child(child_node)
        if @children.include?(child_node)
            @children.delete(child_node) 
            child_node.parent = nil
        else  
            raise "Child not present!"
        end
    end

    def dfs(target)
        return self if self.value == target
        @children.each do |child|
           result = child.dfs(target)
           return result if !result.nil?
        end
        nil
    end

    def bfs(target)
        line = [self]
        until line.empty?
            first_node = line.shift
            return first_node if first_node.value == target
            line += first_node.children
        end
        nil
    end
end