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
    it 'appends data using nodes' do
        list = LinkedList.new
        list.append("doop")
        expect(list.head).to be_a(Node)
        expect(list.head.data).to eq("doop")
        expect(list.head.next_node).to be_nil
    end
    it 'can count nodes' do
        list = LinkedList.new
        list.append("doop")
        expect(list.count).to eq(1)
    end
    it 'can turn node data into string' do
        list = LinkedList.new
        list.append("doop")
        expect(list.to_string).to eq("doop")
    end
end