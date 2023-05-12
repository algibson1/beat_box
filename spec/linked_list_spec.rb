require "./lib/linked_list"
require "./lib/node"

describe LinkedList do
    # Iteration 1
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
    it 'can find tail in list of one node' do
        list = LinkedList.new
        list.append("doop")
        expect(list.tail.data).to eq("doop")
    end
    it 'can find tail in list of multiple nodes' do
        list = LinkedList.new
        list.append("doop")
        list.append("deep")
        expect(list.tail.data).to eq("deep")
        list.append("bop")
        expect(list.tail.data).to eq("bop")
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
    it 'can convert data from multiple nodes to a string' do
        list = LinkedList.new
        expect(list.head).to be_nil
        list.append("doop")
        list.append("deep")
        expect(list.to_string).to eq("doop deep")
        list.append("bop")
        expect(list.to_string).to eq("doop deep bop")
    end
    it 'can count nodes in an empty list' do
        list = LinkedList.new
        expect(list.count).to eq(0)
    end
    it 'can return tail is nil in an empty list' do
        list = LinkedList.new
        expect(list.tail).to be_nil
    end
    it 'can return empty string in an empty list' do
        list = LinkedList.new
        expect(list.to_string).to eq("")
    end
    # Iteration 2
    it 'can prepend nodes' do
        list = LinkedList.new
        list.append("plop")
        expect(list.to_string).to eq("plop")
        list.append("suu")
        list.prepend("dop")
        expect(list.to_string).to eq("dop plop suu")
        expect(list.count).to eq(3)
    end
    xit 'can prepend nodes to empty list' do
        list = LinkedList.new
        list.prepend("dop")
        expect(list.to_string).to eq("dop")
    end
    xit 'can insert nodes' do
        list = LinkedList.new
        list.append("plop")
        list.append("suu")
        list.prepend("dop")
        list.insert(1, "woo")
        expect(list.to_string).to eq("dop woo suu plop")
    end
    xit 'can insert nodes to empty list' do
        list = LinkedList.new
        list.insert(1, "woo")
        expect(list.to_string).to eq("woo")
    end
end