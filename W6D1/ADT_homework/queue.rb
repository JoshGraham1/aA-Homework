class Queue

    attr_reader :my_queue

    def initialize
        @my_queue = []
    end

    def enqueue(el)
        self.my_queue << el
    end

    def dequeue
        self.my_queue.shift
    end

    def peek
        p self.my_queue
    end

end