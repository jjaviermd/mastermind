
class Player

  attr_reader :name
  attr_accessor :picked_color, :picked_number, :color_combination

  def initialize(name)
    @name = name
    @picked_number = nil
    picked_color = nil
    @color_combination = Array.new
  end

  def pick_colors
    puts "\nPick a color\n
          1 -yellow\n
          2 -green\n
          3 -blue\n
          4 -purple\n
          5 -red\n
          6 -orange\n"
    until color_combination.size == 4
    color_combination.push(COLORS[gets.chomp.to_i - 1])
    color_combination
    end
  end
  
end

a = Player.new("me")
a.pick_colors
