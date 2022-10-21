require "./colors_module"

class HumanPlayer

  include ColorsTools

  attr_reader :guess
   
  def initialize
    @guess = Array.new
  end

  def set_guess
    i = ColorsTools.manual_combination
    unless ColorsTools.valid_nums?(i)
      ColorsTools.error
      set_guess
    end
    @guess = ColorsTools.to_colors(i)
  end

  def clear_guess
    @guess.clear
  end
end
