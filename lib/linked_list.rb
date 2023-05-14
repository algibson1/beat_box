class LinkedList 
    attr_reader :head
    def initialize
        @head = nil
    end
    def append(data)
        if !@head
            @head = Node.new(data)
        else
        self.tail.append_node(Node.new(data))
        end
        data
    end
    def prepend(data)
        current_nodes = @head 
        @head = Node.new(data)
        @head.append_node(current_nodes)
        data
    end
    def tail
        return nil unless @head
        node = @head
        until node.next_node == nil
            node = node.next_node
        end
        node
    end
    def count
        return 0 if !@head
        tally = 1
        node = @head
        while node.next_node
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
        if !@head
            @head = Node.new(data)
        elsif number == 0
            prepend(data)
        elsif number < count
            previous_nodes = @head
            (number-1).times do |i|
                previous_nodes = previous_nodes.next_node
            end
            later_nodes = previous_nodes.next_node
            beginning_nodes = previous_nodes.append_node(Node.new(data))
            beginning_nodes.append_node(later_nodes)
        else
            append(data)
        end
    end
    def find(position, quantity)
        return nil if @head == nil || position > count
        strings = []
        node = @head
        until node.next_node == nil 
            strings << node.data
            node = node.next_node
        end
        strings << tail.data
        found = strings[position..(position - 1 + quantity)]
        found.join(" ")
    end
    def includes?(data)
        match = false
        node = @head
        count.times do |i|
            match = true if node.data == data
            node = node.next_node
        end
        match
    end
    def pop 
        popped = tail&.data
        node = @head
        while node&.next_node&.next_node
            node = node.next_node
        end
        node&.append_node(nil)
        @head = nil if @head == node
        popped
    end
end