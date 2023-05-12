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
    def prepend(data)
        current_nodes = @head 
        if current_nodes == nil
            @head = Node.new(data)
        else
        prepend_node = Node.new(data)
        prepend_node.append_node(current_nodes)
        @head = prepend_node
        end
    end
    def tail
        return nil unless @head != nil
        node = @head
        return node if node.next_node == nil
        while node.next_node != nil
            node = node.next_node
        end
        node
    end
    def count
        return 0 if @head == nil
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
        return "" if @head == nil
        return @head.data if @head.next_node == nil
        node = @head
        data = []
        while node.next_node != nil
            data << node.data
            node = node.next_node
        end
        data << tail.data
        data_string = data.join(" ")
    end
    def insert(number, data)
        @head = Node.new(data) if @head == nil
        previous_nodes = @head
        (number-1).times do |i|
            previous_nodes = previous_nodes.next_node
        end
        later_nodes = previous_nodes.next_node
        beginning_nodes = previous_nodes.append_node(Node.new(data))
        full_new_list = beginning_nodes.append_node(later_nodes)
    end
end