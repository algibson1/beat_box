class BeatBox
    attr_reader :list
    attr_accessor :voice, :rate
    def initialize(string = nil)
        @list = LinkedList.new
        @voice = "Boing"
        @rate = 500
        @valid_beats = ["tee", "tee", "doo", "hoo", "ditt", "deep", "bop", "boop", "la", "na", "doop", "plop", "suu", "dop", "woo", "hop", "shi", "shu", "blop"]
        append(string) if string
    end
    def append(string)
        sounds = string.split
        sounds.each do |data|
            @list.append(data) if @valid_beats.include?(data)
        end
        string
    end
    def count
        @list.count
    end
    def play
        `say -r #{@rate} -v #{@voice} #{@list.to_string}`
        @list.count
    end
    def prepend(string)
        sounds = string.split.reverse
        sounds.each do |data|
            @list.prepend(data) if @valid_beats.include?(data)
        end
        string
    end
    def all
        @list.to_string
    end
    def reset_voice
        @voice = "Boing"
    end
    def reset_rate
        @rate = 500
    end
end


