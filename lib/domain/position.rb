# frozen_string_literal: true

class Position
  attr_accessor :row, :col, :piece, :states

  def initialize(row, col)
    @row = row
    @col = col
    @piece = nil
    @states = { free: false,
                occupied_by_white: false,
                occupied_by_black: false,
                attacked_by_white: false,
                attacked_by_black: false }
  end

  def piece=(piece)
    @piece = piece
    piece.current_position = as_array
  end

  def remove_piece
    @piece = nil
  end

  def as_array
    [@row, @col]
  end

  def being_attacked?
    being_attacked_by_white? || being_attacked_by_black?
  end

  def being_attacked_by_white?
    @states[:attacked_by_white]
  end

  def being_attacked_by_black?
    @states[:attacked_by_black]
  end

  def being_attacked_by?(color)
    return @states[:attacked_by_white] if color == 'white'

    @states[:attacked_by_black]
  end

  def free?
    @states[:free]
  end

  def occupied_by?(color)
    return @states[:occupied_by_white] if color == 'white'

    @states[:occupied_by_black]
  end
end
