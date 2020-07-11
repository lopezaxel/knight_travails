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
      0.upto(7) do |column|
        board << [row, column]
      end
    end

    board
  end
end

gameboard = Gameboard.new

