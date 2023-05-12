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
        return 1 if @head.next_node == nil
        tally = 1
        node = @head
        while node.next_node != nil
            tally += 1
            node = node.next_node
        end
        tally
    end
    def to_string
        @head.data.to_s
    end
end