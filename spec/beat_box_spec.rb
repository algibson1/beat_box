require "./lib/beat_box"
require "./lib/linked_list"
require "./lib/node"
require "rspec"

describe BeatBox do
    it 'exists' do
        bb = BeatBox.new
        expect(bb).to be_a(BeatBox)
        expect(bb.list).to be_a(LinkedList)
    end
    it 'can append data' do
        bb = BeatBox.new
        expect(bb.list.head).to be_nil
        expect(bb.append("deep doo ditt")).to eq("deep doo ditt")
        expect(list.head.data).to eq("deep")
        expect(bb.list.head.next_node.data).to eq("doo")
        expect(bb.append("woo hoo shu")).to eq("woo hoo shu")
    end
    it 'can count nodes' do
        bb = BeatBox.new
        bb.append("deep doo ditt")
        bb.append("woo hoo shu")
        expect(bb.count).to eq(6)
    end
end