require_relative "board"
require_relative "player"

class Game
    
    attr_accessor :p1, :p2, :board, :active_player
    def initialize(p1="p1", p2="p2")
        @board = Board.new
        @p1 = Player.new(p1, "\u2660".encode('utf-8'))
        @p2 = Player.new(p2, "\u2662".encode('utf-8'))
        @active_player = @p1
    end

    def illicit_move
        puts "Pick a column #{self.active_player.name}"
        choice = gets.chomp.to_i - 1
        correct_input = false
        while !correct_input
            if board.valid_move?(choice)
                correct_input = true
            else
                system "clear"
                self.board.to_s
                puts "That is an invalid move #{self.active_player.name}, try again"
                choice = gets.chomp.to_i - 1
            end
        end
        return choice

    end

    def switch_active_player
        self.p1 == self.active_player ? self.active_player = self.p2 : self.active_player = self.p1
    end

    def play
        self.intro
        win = false
        while !win
            system "clear"
            board.to_s
            move = self.illicit_move
            board.make_move(move, self.active_player.marker)
            win = board.win?(move, self.active_player.marker)
            self.switch_active_player if !win
        end
        system "clear"
        board.to_s
        puts "Congratulations #{self.active_player.name}"
    end

    def intro
        puts "Welcome to Connect 4"
        puts "Hope you have a buddy to play with, because this is a two player game!"
        puts "To win the game, you have to align 4 of your tokens in a row"
        puts "You and your opponent alternate turns 'dropping' each of your tokens"
        puts "All you must do is select a column when it is your turn"
        puts " "
        puts "Player 1 will start, please enter your name"
        self.p1.name = gets.chomp
        puts "Player 2, what is your name?"
        self.p2.name = gets.chomp
        system "clear"
    end
    
end