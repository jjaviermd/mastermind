
module GameTools

  attemps

  def compare (a, b)
    attemps -= 1
    feedback_zero if a.intersection(b).length == 0

    if a == b
      same_code_feedback
    else
      a.intersection(b).each do |i|
        unless a.index(i) == b.index(i)
          relative_fedback
        else
          absolute_feedback
        end
      end
    end
  end


  def game_start
    if current_secret
      puts "Secret code live./nTurns left:#{ATTEMPS}"
    end
  end

  def feedback_zero
    puts "Zero coincidences"
  end

  def relative_fedback
    puts "Color missplaced"
  end

  def absolute_feedback
    puts "Color properly placed"
  end

  def same_code_feedback
    puts "Congratulations! You broke the secret code"
  end

  def turns
    puts "#{ATTEMPS} attemps left" if ATTEMPS > 0
    puts "Game over!" if ATTEMPS == 0
  end

end
