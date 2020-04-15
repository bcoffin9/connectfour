require_relative "cell"

class Board
    attr_accessor :rows
    attr_reader :width, :height
    DIRECTIONS = ["N", "NE", "E", "SE", "S", "SW", "W", "NW"]

    def initialize(val=nil)
        @rows = Array.new(6) { Array.new(7) { Cell.new(val) } }
        @height = 6
        @width = 7
    end

    def to_s
        puts ""
        self.rows.each_with_index do |row, idx|
            puts "||#{row.join("||")}"
            puts "---------------------"
        end
        puts "  1  2  3  4  5  6  7"
    end

    def win?(move, marker)
        win = false
        x = move
        y = get_move_y(x)
        DIRECTIONS.each do |dir|
            transform = clock_check(dir)
            temp_x = x
            temp_y = y
            counter = 0
            while counter < 3
                temp_x = temp_x + transform[0]
                temp_y = temp_y + transform[1]
                break if temp_x < 0 || temp_x > self.width - 1 # O.B.
                break if temp_y < 0 || temp_y > self.height - 1 # O.B.
                break if self.rows[temp_y][temp_x].val != marker # does it match?
                counter = counter + 1
            end
            win = true if counter == 3
            break if win
        end
        win
    end

    def valid_move?(move) # takes in column and checks top row
        if move > 6 || move < 0
            return false
        elsif self.rows[0][move].val != nil
            return false
        else
            puts self.rows[0][move].val
            return true
        end 
    end

    def make_move(move, marker) # takes in column and populates move
        height.times do |idx|
            idx = height - idx - 1 # start from the bottom up
            if self.rows[idx][move].val == nil
                self.rows[idx][move].val = marker
                break
            end
        end
    end

    private # not called by the outside world
            # ex - will not be called either by self.clock_check(dir) or board.clock_check(dir)

    def clock_check(dir)
        case dir
        when "N"
            [0,-1]
        when "NE"
            [1,-1]
        when "E"
            [1,0]
        when "SE"
            [1,1]
        when "S"
            [0,1]
        when "SW"
            [-1,1]
        when "W"
            [-1,0]
        when "NW"
            [-1,-1]
        else
            "Error"
        end
    end

    def get_move_y(move)
        height.times do |idx|
            return idx if self.rows[idx][move].val != nil
        end
    end
end