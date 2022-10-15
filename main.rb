COLORS = %w[yellow green blue purple red orange]

def get_secret_code
  secret_code = Array.new(4){COLORS.sample}
end

def pick_color
  puts "Pick a color\n
        1 -yellow\n
        2 -green\n
        3 -blue\n
        4 -purple\n
        5 -red\n
        6 -orange\n"
  selected_number = gets.chomp.to_i
  COLORS[selected_number - 1]
end