require 'pry'

class Gameboard
  attr_accessor :board, :knight

  def initialize(knight)
    @board = create_board
    @knight = knight
  end

  def create_board
    board = Array.new(8, []) 
    board.each { |row| row << [] }
  end

  def fill_board
    board.each_with_index do |row, row_idx|
      row.map!.with_index do |col, col_idx|
        square = [row_idx + 1, col_idx + 1] 
        col = knight.moves(square) 
        p "#{square}: #{col}"
      end
    end
    
    board
  end
end

class Knight
  def initialize

  end

 def add_move(square, moves)
    row = square[0]
    col = square[1]

    if row >= 1 && row <= 8 && col >= 1 && col <= 8
      moves << [(96 + col).chr, row]
    end

    moves
  end

  def moves(square)
    row = square[0] + 1
    col = square[1] + 1
    possible_moves = [] 

    add_move([row + 1, col - 2], possible_moves)
    add_move([row + 1, col + 2], possible_moves)
    add_move([row - 1, col - 2], possible_moves)
    add_move([row - 1, col + 2], possible_moves)
    add_move([row + 2, col + 1], possible_moves)
    add_move([row + 2, col - 1], possible_moves)
    add_move([row - 2, col - 1], possible_moves)
    add_move([row - 2, col + 1], possible_moves)

    possible_moves
  end
end

knight = Knight.new
gameboard = Gameboard.new(knight)

#gameboard.fill_board

