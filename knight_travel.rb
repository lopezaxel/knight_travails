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
    path = []
    path << end_sq
    until path.first == start_sq
      previous = bfs(start_sq, path.first)
      path.unshift(previous)
    end

    path
  end

  def bfs(start_sq, end_sq)
    queue = []  
    queue << start_sq

    visited = Array.new(8) {Array.new(8, false)}
    path = gameboard.create_board

    visited[start_sq[0]][start_sq[1]] = true
    until queue.empty?
      sq = queue.shift 
      possible_moves = moves(sq)
     
      possible_moves.each do |move|
        if !visited[move[0]][move[1]]
          if move == end_sq
            path[move[0]][move[1]] = sq
            return path[move[0]][move[1]]
          end
          queue << move
          visited[move[0]][move[1]] = true
          path[move[0]][move[1]] = sq
        end
      end
    end
  end
end

gameboard = Gameboard.new
knight = Knight.new(gameboard)

p knight.knight_moves([3, 3], [4, 3])
p knight.knight_moves([0, 0], [7, 7])

