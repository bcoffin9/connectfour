class Cell

    attr_accessor :val
    
    def initialize(val=nil)
        @val = val
    end

    def to_s
        self.val == nil ? "O" : self.val
    end

end