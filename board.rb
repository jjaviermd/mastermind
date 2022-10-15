class Board
  attr_reader :board, :turns
  def initialize
    @turns = 12
    @board = Array.new(13){Array.new(5,"")}
  end

  def print_board
    puts "==1=====2=====3=====4=====?=="
    board.each do |row| 
      puts row.join("     I")
      puts "============================="
    end
  end
end

b = Board.new
b.print_board