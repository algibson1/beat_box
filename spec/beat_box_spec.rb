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
        expect(bb.list.head.data).to eq("deep")
        expect(bb.list.head.next_node.data).to eq("doo")
        expect(bb.append("woo hoo shu")).to eq("woo hoo shu")
    end
    it 'can count nodes' do
        bb = BeatBox.new
        bb.append("deep doo ditt")
        bb.append("woo hoo shu")
        expect(bb.count).to eq(6)
    end
    it 'can play beats!' do
        bb = BeatBox.new
        bb.append("deep doo ditt woo hoo shu")
        expect(bb.count).to eq(6)
        expect(bb.list.count).to eq(6)
        expect(bb.play).to eq(6)
    end
    # Iteration 4
    it 'can prepend data' do
        bb = BeatBox.new("deep")
        bb.prepend("woo hoo shu")
        expect(bb.list.to_string).to eq("woo hoo shu deep")
    end
    it 'can print all beats to string' do
        bb = BeatBox.new("deep")
        expect(bb.all).to eq("deep")
        bb.prepend("tee tee tee Mississippi")
        expect(bb.all).to eq("tee tee tee deep")
    end
    it 'can reject invalid beats' do
        bb = BeatBox.new("deep")
        bb.append("Mississippi")
        expect(bb.all).to eq("deep")
        bb.prepend("tee tee tee Mississippi")
        expect(bb.all).to eq("tee tee tee deep")
    end
    it 'can change voice' do
        bb = BeatBox.new("deep dop dop deep")
        expect(bb.play).to eq(4)
        expect(bb.voice = "Daniel").to eq("Daniel")
        expect(bb.voice).to eq("Daniel")
        expect(bb.play).to eq(4)
    end
    it 'can change rate' do
        bb = BeatBox.new("deep dop dop deep")
        expect(bb.rate).to eq(500)
        expect(bb.rate = 100).to eq(100)
        expect(bb.play).to eq(4)
        expect(bb.rate).to eq(100)
    end
    it 'can reset voice' do
        bb = BeatBox.new("deep dop dop deep")
        expect(bb.voice).to eq("Boing")
        bb.voice = "Daniel"
        expect(bb.voice).to eq("Daniel")
        expect(bb.play).to eq(4)
        expect(bb.reset_voice).to eq("Boing")
        expect(bb.voice).to eq("Boing")
        expect(bb.play).to eq(4)
    end
    it 'can reset rate' do
        bb = BeatBox.new("deep dop dop deep")
        expect(bb.rate).to eq(500)
        bb.rate = 100
        expect(bb.rate).to eq(100)
        expect(bb.play).to eq(4)
        expect(bb.reset_rate).to eq(500)
        expect(bb.rate).to eq(500)
        expect(bb.play).to eq(4)
    end
end