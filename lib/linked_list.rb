class LinkedList 
    attr_reader :head
    def initialize
        @head = nil
    end
    def append(data)
        @head = Node.new(data) if @head == nil
    end
    def count
        tally = 0
        tally += 1 if @head.next_node == nil
        tally
    end
end