require "byebug"
module ColorsTools

  COLORS = %w[yellow green blue purple red orange]

  def self.manual_combination
    puts "\nPick four colors\n
          1 -yellow
          2 -green
          3 -blue
          4 -purple
          5 -red
          6 -orange\n"
          #byebug
    num_code = gets.chomp.split("").map { |n| n.to_i - 1}
  end

  def self.valid_nums?(code)
    if code.length == 4 && code.all? { |n| n.between?(1, 5)}
      return true
    end
    false
  end

  def self.error
    puts "Code non valid!. Please select four numbers between 1 and 6."
  end

  def self.to_colors(code)
    code.map{ |n| COLORS[n]}
  end
end

test = ColorsTools.manual_combination
puts ColorsTools.to_colors(test) if ColorsTools.valid_nums?(test)
ColorsTools.error unless ColorsTools.valid_nums?(test)

