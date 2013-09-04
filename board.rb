require 'pry'
require './cell.rb'

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
    20.times do
      print '-'
    end
    print "\n"
  end

  def run_generation
    current_board = @board
    @board = []
    current_board.each_with_index do |row, row_index|
      row.each_with_index do |cell, col_index|
        c = Cell.new "0"
        alive_count = neighbours_alive_count(row_index, col_index, current_board)
        if cell.live
          if alive_count < 2 || alive_count > 3
            c.live = false
          elsif alive_count == 2 || alive_count == 3
            c.live = true
          end
        else
          c.live = true if alive_count == 3
        end
        set_cell(row_index, col_index, c)
      end
    end
  end

  def get_neighbours row, col
    return [
      [row - 1, col - 1], [row - 1, col], [row - 1, col + 1],
      [row, col - 1]    ,                 [row, col + 1],
      [row + 1, col - 1], [row + 1, col], [row + 1, col + 1]
    ]
  end

  def neighbours_alive_count row, col, board
    neighbours = get_neighbours row, col
    alive_count = 0
    neighbours.each do |n|
      next if n[0] < 0 || n[1] < 0 || n[0] >= board[0].count || n[1] >= board[0].count
      n_cell = board[n[0]][n[1]]
      binding.pry if n_cell.nil?
      alive_count += 1 if n_cell.live
    end
    return alive_count
  end

end