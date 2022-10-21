
class Board
  attr_reader :board, :turns
  def initialize
    @turns = 0
    @board = Array.new(13){Array.new(5,"")}
  end

  def print_board
    puts "==1=====2=====3=====4=====?=="
    board.each do |row| 
      puts row.join("     I")
      puts "============================="
    end
  end

  def get_secret_code
    secret_code = Array.new(4){COLORS.sample}
  end

  def put_color(color, place)
    board[turns][]
  end

  def update_row(guess)
    board[turns][0..4] = guess
  end

  def feedback
    
  end
end

b = Board.new
b.print_board
b.get_secret_code
b.update_row([1,2,3,4])