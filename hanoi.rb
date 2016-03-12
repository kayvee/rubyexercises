# Write a Towers of Hanoi game.
#
# Keep three arrays, which represents the piles of discs.
# Pick a representation of the discs to store in the arrays; maybe just a number representing their size.
# Don't worry too much about making the user inteface pretty.
#
# In a loop, prompt the user (using gets) and ask what pile to select a disc from,
# and where to put it.
#
# After each move, check to see if they have succeeded in moving all the discs, to the final pile.
# If so, they win!

class Hanoi #Pronounced HAN-waa, #obv
  attr_reader :board

  def initialize
    @board = [[3, 2, 1], [], []] #tight
  end

  def render
    render_string = ""
    @board.each do |tower|
      render_string.concat("[")
      tower.each do |el|
        render_string.concat("#{el}")
      end
      render_string.concat("]")
    end
    render_string
  end

  def move(from_tower, to_tower)
    @board[to_tower - 1].push(@board[from_tower - 1].pop) if @board[from_tower - 1].size > 0  && (@board[to_tower - 1].size == 0 || @board[from_tower - 1][-1] < @board[to_tower - 1][-1])
    "potatoes"
  end

  def won?
    return true if @board[0].size == 0 && @board[1].size == 0
  end

end
