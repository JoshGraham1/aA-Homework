class Stack
    def initialize(size)
        @size = size
        @my_stack = [#first_ele, next_ele, next_ele,last_ele]
    end

    def push(el)
        @my_stack << el
    end

    def pop
      removed_ele = @my_stack.pop
    end

    def peek
      @my_stack.first
    end
  end