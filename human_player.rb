require "./colors_module"
## HumanPlayer class allows to create instances of human playersn for mastermind game.
class HumanPlayer

  include ColorsTools
# #guess method returns value of @guess variable. An array with four valid colors.
  attr_reader :guess
   
  def initialize
    @guess = Array.new
  end
# #set_guess uses #manual_combination, #valid_nums? and #error from ColorsTools modules
# to set the contents of @guess
  def set_guess
    i = ColorsTools.manual_combination
    unless ColorsTools.valid_nums?(i)
      ColorsTools.error
      set_guess
    end
    @guess = ColorsTools.to_colors(i)
  end
# #clear guess: clear content of @guess.
  def clear_guess
    @guess.clear
  end
end
