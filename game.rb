
%w[./pc_player ./human_player].each { |file| require file }
# This class creates agame instances.
class Game
  attr_reader :attemps, :terminate, :restart

  def initialize
    @attemps = 12
    @terminate = false
    @restart = false
  end
  # compare takes two array of colors as arguments. and returns
  # differents feedbacks based upon the result.
  # "zero coincidences" if arrays don't share any value.
  # "color missplaced" if one or more color guesed are in the secret code
  # but not en that position.
  # "color properly placed" if one or more guessed color are in the secret code
  # in that excat position.
  def compare(a, b)
    @attemps -= 1
    feedback_zero if a.intersection(b).length.zero?

    if a == b
      same_code_feedback
    else
      a.intersection(b).each do |i|
        if a.index(i) == b.index(i)
          absolute_feedback
        else
          relative_fedback
        end
      end
    end
  end
  # Initialize the game
  def game_start(current_secret)
    puts "\n\nSecret code live.\n\nTurns left:#{attemps}" if current_secret
  end

  def feedback_zero
    puts "\t\nZero coincidences"
  end

  def relative_fedback
    puts "\t\nColor missplaced"
  end

  def absolute_feedback
    puts "\t\nColor properly placed"
  end

  def same_code_feedback
    puts "\n\tCongratulations! You broke the secret code"
    game_over
  end

  def turns_left
    puts "\n#{attemps} attemps left"
  end

  def game_over
    @terminate = true
    puts 'Game over!'
  end
  # Ask the player if wnats to play another match.
  # Only posibles answers are y for yes and n for no.
  def retry?
    puts 'Retry?
        Y -Yes
        N -No'
    response = gets.chomp
    case response
    when 'y'
      @restart = true
    when 'n'
      restart = false
    else
      puts 'Type y or n please'
      retry?
    end
  end
end
