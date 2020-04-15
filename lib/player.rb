class Player

    attr_accessor :name
    attr_reader :marker

    def initialize(name="CPU", marker)
        @name=name
        @marker=marker
    end

    def to_s
        "#{name}'s marker is #{marker}"
    end

end