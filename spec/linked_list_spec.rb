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
        node = list.append("doop")
        expect(node).to eq("doop")
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

    it 'can prepend nodes to empty list' do
        list = LinkedList.new
        list.prepend("dop")
        expect(list.to_string).to eq("dop")
    end

    it 'can insert nodes' do
        list = LinkedList.new
        list.append("plop")
        list.append("suu")
        list.prepend("dop")
        list.insert(1, "woo")
        expect(list.to_string).to eq("dop woo plop suu")
    end

    it 'can insert nodes part two (longer list)' do
        list = LinkedList.new
        list.append("plop")
        list.append("suu")
        list.prepend("dop")
        list.append("beep")
        list.append("hop")
        list.append("boop")
        list.append("deep")
        list.append("doop")
        list.insert(5, "woo")
        expect(list.to_string).to eq("dop plop suu beep hop woo boop deep doop")
    end

    it 'can insert nodes to empty list' do
        list = LinkedList.new
        list.insert(3, "woo")
        expect(list.to_string).to eq("woo")
    end

    it 'adds inserted nodes to end when number is greater than count' do
        list = LinkedList.new
        list.append("plop")
        list.append("suu")
        list.insert(5, "woo")
        expect(list.to_string).to eq("plop suu woo")
        expect(list.count).to eq(3)
    end

    it 'can prepend using insert' do
        list = LinkedList.new
        list.append("plop")
        list.append("suu")
        list.insert(0, "woo")
        expect(list.to_string).to eq("woo plop suu")
    end

    it 'can find node data' do
        list = LinkedList.new
        list.append("deep")
        list.append("woo")
        list.append("shi")
        list.append("shu")
        list.append("blop")
        expect(list.to_string).to eq("deep woo shi shu blop")
        expect(list.find(2,1)).to eq("shi")
        expect(list.find(1,3)).to eq("woo shi shu")
    end

    it 'returns nil if find is called on empty list' do
        list = LinkedList.new
        expect(list.find(2,1)).to be_nil
    end

    it 'returns nil if node position in find does not exist' do
        list = LinkedList.new
        list.append("deep")
        list.append("woo")
        list.append("shi")
        list.append("shu")
        list.append("blop")
        expect(list.find(7,1)).to be_nil
    end

    it 'returns all trailing nodes even if find quantity is too high' do
        list = LinkedList.new
        list.append("deep")
        list.append("woo")
        list.append("shi")
        list.append("shu")
        list.append("blop")
        expect(list.find(2, 7)).to eq("shi shu blop")
    end

    it 'position 0 works as an argument in find method' do
        list = LinkedList.new
        list.append("deep")
        list.append("woo")
        list.append("shi")
        list.append("shu")
        list.append("blop")
        expect(list.find(0, 2)).to eq("deep woo")
    end

    it 'can see if nodes include certain data' do
        list = LinkedList.new
        list.append("deep")
        list.append("woo")
        list.append("shi")
        list.append("shu")
        list.append("blop")
        expect(list.includes?("deep")).to be true
        expect(list.includes?("dep")).to be false
    end

    it 'does not error when include method is called on empty list' do
        list = LinkedList.new
        expect(list.includes?("deep")).to be false
    end

    it 'checks for full node data' do
        list = LinkedList.new
        list.append("deep")
        list.append("woo")
        list.append("shi")
        list.append("shu")
        list.append("blop")
        expect(list.includes?("deep")).to be true
        expect(list.includes?("dee")).to be false
    end

    it 'pops tail node from list' do
        list = LinkedList.new
        list.append("deep")
        list.append("woo")
        list.append("shi")
        list.append("shu")
        list.append("blop")
        expect(list.pop).to eq("blop")
        expect(list.pop).to eq("shu")
        expect(list.to_string).to eq("deep woo shi")
    end

    it 'can pop head if it is the only node' do
        list = LinkedList.new
        list.append("deep")
        expect(list.pop).to eq("deep")
        expect(list.head).to be_nil
        expect(list.count).to eq(0)
    end
    
    it 'cannot pop anything if list is empty' do
        list = LinkedList.new
        expect(list.pop).to be_nil
    end
end