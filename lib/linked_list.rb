class LinkedList 
    attr_reader :head
    def initialize
        @head = nil
    end
    def append(data)
        if @head == nil
            @head = Node.new(data)
        else
        self.tail.append_node(Node.new(data))
        end
    end
    def tail
        node = @head
        return node if node.next_node == nil
        while node.next_node != nil
            node = node.next_node
        end
        node
    end
    def count
        tally = 0
        tally += 1 if @head.next_node == nil
        tally
    end
    def to_string
        @head.data.to_s
    end
end