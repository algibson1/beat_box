require ".lib/node"
require "rspec"

describe Node do
    before do
        node = Node.new("plop")
    end
    it 'exists' do
        expect(node).to be_a(Node)
    end
end