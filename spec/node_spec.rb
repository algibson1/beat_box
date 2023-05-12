require "./lib/node"
require "rspec"

describe Node do
    it 'exists' do
        node = Node.new("plop")

        expect(node).to be_a(Node)
    end
    it 'has data' do
        node = Node.new("plop")

        expect(node.data).to eq("plop")
        expect(node.next_node).to eq(nil)
    end
    it 'can append new nodes' do
        node = Node.new("plop")
        second_node = Node.new("beep")
        node.append_node(second_node)
        expect(node.next_node).to eq(second_node)
    end
end