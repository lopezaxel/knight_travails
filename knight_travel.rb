require 'pry'

# knight_moves([0,0],[1,2]) == [[0,0],[1,2]]
# knight_moves([0,0],[3,3]) == [[0,0],[1,2],[3,3]]
# knight_moves([3,3],[0,0]) == [[3,3],[1,2],[0,0]]

class Gameboard
  attr_reader :board

  def initialize
    @board = create_board
  end

  def create_board
    board = []

    7.downto(0) do |row|
      0.upto(7) do |col|
        board << [row, col]
      end
    end

    board
  end
end

class Knight
  attr_reader :board

  def initialize(gameboard)
    @board = gameboard.board
  end

  def possible_moves(square, board = self.board)
    moves = []

    (-2).upto(2) do |row|
      (-2).upto(2) do |col|
        next if row.abs == col.abs || row == 0 || col == 0

        square = [row, col]
        moves << square if board.include?(square)
      end
    end

    moves.sort
  end
end


gameboard = Gameboard.new
knight = Knight.new(gameboard)

p knight.possible_moves([0, 0])


