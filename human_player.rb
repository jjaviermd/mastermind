require "./colors_module"

class HumanPlayer

  include ColorsTools

  #attr_reader :guess

  def initialize
    @guess = Array.new
  end

  def guess
    i = ColorsTools.manual_combination
    unless ColorsTools.valid_nums?(i)
      ColorsTools.error
      guess
    end
    ColorsTools.to_colors(i)
  end


end
 
mary = HumanPlayer.new
p mary.guess