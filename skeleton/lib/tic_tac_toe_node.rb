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
    children_arr = []
    if @next_mover_mark == :x
      next_mark = :o
    else
      next_mark = :x
    end

    @board.rows.each_with_index do |row, row_idx|
      row.each_with_index do |pos, pos_idx|
        new_board = @board.dup
        if new_board[[row_idx, pos_idx]] == nil
          new_board[[row_idx, pos_idx]] = @next_mover_mark
        end

        if !new_board.over?
          children_arr << TicTacToeNode.new(new_board, next_mark, [row_idx, pos_idx])
        end
      end
    end
    children_arr
  end

  def self.deep_dup(board)
    output = []
    (0...board.length).each do |row|
      subarray = []
      (0...row.length).each do |pos|
        subarray << pos
      end
      ouput << subarray
    end
    output
  end
end


p my_node = TicTacToeNode.new(Board.new, :x)

p my_node.children 