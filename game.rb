require "./colors_module"

include ColorsTools



  def comp_codes(a, b)
    a.intersection(b)
  end

  def comparator(a, b)
    feedback_zero if a.intersection(b).length == 0

    if a == b
      same_code_feedback
    else
      a.intersection(b).each do |i|
        unless a.index(i) == b.index(i)
          relative_fedback
        else
          absulute_feedback
        end
      end
    end
  end

  def feedback_zero
    puts "Zero coincidences"
  end

  def relative_fedback
    puts "Color missplaced"
  end

  def absulute_feedback
    puts "Color properly placed"
  end

  def same_code_feedback
    puts "Congratulations! You broke the secret code"
  end

# x = ColorsTools.random_color
# puts x
#
# y = ColorsTools.random_color
# puts y
#
# p comp_codes(x,y)

x = [1,2,3,4]
y = [1,2,3,5]
comparator(x,y)
