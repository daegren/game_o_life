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
  end

  def run_generation
    current_board = @board
    @board = []
    current_board.each_with_index do |row, row_index|
      row.each_with_index do |cell, col_index|
        c = Cell.new "0"
        if cell.live
          neighbours = get_neighbours row_index, col_index
          alive_count = 0
          neighbours.each do |n|
            next if n[0] < 0 || n[1] < 0
            n_cell = current_board[n[0]][n[1]]
            alive_count += 1 if n_cell.live

          end
          binding.pry
          c.live = false if alive_count < 2
        else
        end
        set_cell row_index, col_index, c
      end
    end
  end

  def get_neighbours row, col
    return [
      [row - 1, col - 1], [row - 1, col], [row - 1, col + 1],
      [row, col - 1]    ,                 [row, col + 1],
      [row + 1, col - 1], [row + 1, col], [row + 1, col - 1]
    ]
  end

end