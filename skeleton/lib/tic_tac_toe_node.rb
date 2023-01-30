require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    empty_spaces = 0
    board.rows.each do |row|
      row.each do |pos|

        if pos == nil
          empty_spaces += 1
        end
      end
    end
    empty_spaces.times do |i|
      row = i / 3
      column = i % 3
    end
    output = Array.new(empty_spaces) {[]}
  end
end


# p my_node = TicTacToeNode.new(Board.new, :x)

# p my_node.children 