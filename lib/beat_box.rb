class BeatBox
    attr_reader :list
    def initialize
        @list = LinkedList.new
    end
    def append(string)
        sounds = string.split
        sounds.each do |data|
            @list.append(data)
        end
        string
    end
    def count
        @list.count
    end
    def play
        `say -r 150 -v Boing #{@list.to_string}`
    end
end


