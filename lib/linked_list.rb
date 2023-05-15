class LinkedList 
    attr_reader :head
    def initialize
        @head = nil
    end

    def append(data)
        if @head.nil?
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
        node = @head
        until node&.next_node.nil?
            node = node.next_node
        end
        node
    end

    def count
        return 0 if @head.nil?
        tally = 1
        node = @head
        while node.next_node
            tally += 1
            node = node.next_node
        end
        tally
    end

    def to_string
        node = @head
        data = []
        while node&.next_node
            data << node.data
            node = node.next_node
        end
        data << tail&.data
        data_string = data&.join(" ")
    end

    def insert(number, data)
        if @head.nil?
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
        beats = self.to_string.split
        found = beats[position..(position - 1 + quantity)]
        found&.join(" ")
    end

    def includes?(data)
        beats = self.to_string.split
        beats.include?(data)
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