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
        data
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
        until node.next_node == nil
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
        if @head == nil
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
            full_new_list = beginning_nodes.append_node(later_nodes)
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
        if count > 1
            popped = tail.data
            node = @head
            until node.next_node.next_node == nil
                node = node.next_node
            end
            node.append_node(nil)
            popped
        elsif count ==0
            nil
        else
            popped = @head.data
            @head = nil
            popped
        end
    end
end