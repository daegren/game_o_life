class Board
  def initialize
    @board = []
  end

  def set_cell row, column, cell
    @board[row] = [] if @board[row] == nil

    @board[row][column] = cell
  end

  def draw_board
    @board.each do |row|
      row.each do |cell|
        print cell.live ? 'X' : ' '
      end
      print "\n"
    end
  end
end