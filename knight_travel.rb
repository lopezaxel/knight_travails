require 'pry'

class Gameboard
  attr_accessor :board, :knight

  def initialize
    @board = create_board
  end

  def create_board
    Array.new(8) { Array.new(8, []) }
    # fill_board(board)
  end

  def fill_board(board)
    8.times do |row|
      8.times do |col|
        square = [row, col]
        moves = knight.moves(square)
        board[row][col] = moves
      end
    end
    
    board
  end
end

class Knight
  attr_reader :gameboard

  def initialize(gameboard)
    @gameboard = gameboard
  end

 def add_move(square, moves)
    row = square[0]
    col = square[1]

    if row >= 0 && row <= 7 && col >= 0 && col <= 7
      moves << square 
    end

    moves
  end

  def moves(square)
    row = square[0]
    col = square[1]
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

  def knight_moves(start_sq, end_sq)
    queue = []  
    queue << start_sq

    visited = gameboard.create_board
    until queue.empty?
      sq = queue.shift 

      if visited[sq[0]][sq[1]] != true
        moves(sq).each do |move|
          if move == end_sq
            return [sq, end_sq]
          end
          queue << move
          visited[sq[0]][sq[1]] = true
        end
      end
    end
  end
end

gameboard = Gameboard.new
knight = Knight.new(gameboard)

p knight.knight_moves([0, 0], [7, 7])

