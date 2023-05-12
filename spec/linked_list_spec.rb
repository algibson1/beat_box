require "./lib/linked_list"
require "./lib/node"

describe LinkedList do
    it 'exists' do
        list = LinkedList.new
        expect(list).to be_a(LinkedList)
    end
    it 'has no head by default' do
        list = LinkedList.new
        expect(list.head).to be_nil
    end
    it 'appends data from one node' do
        list = LinkedList.new
        list.append("doop")
        expect(list.head).to be_a(Node)
        expect(list.head.data).to eq("doop")
        expect(list.head.next_node).to be_nil
    end
    it 'can count a single node' do
        list = LinkedList.new
        list.append("doop")
        expect(list.count).to eq(1)
    end
    it 'can turn data into string from one node' do
        list = LinkedList.new
        list.append("doop")
        expect(list.to_string).to eq("doop")
    end
    it 'can append multiple nodes' do
        list = LinkedList.new
        expect(list.head).to be_nil
        list.append("doop")
        list.append("deep")
        expect(list.head.next_node).to be_a(Node)
        expect(list.head.next_node.data).to eq("deep")
        expect(list.head.next_node.next_node).to be_nil
        list.append("bop")
        expect(list.head.next_node.next_node).to be_a(Node)
    end
    it 'can count multiple nodes' do
        list = LinkedList.new
        expect(list.head).to be_nil
        list.append("doop")
        list.append("deep")
        expect(list.count).to eq(2)
        list.append("bop")
        expect(list.count).to eq(3)
    end
end