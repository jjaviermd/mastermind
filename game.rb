# frozen_string_literal: true

%w[./pc_player ./human_player].each { |file| require file }

class Game
  attr_reader :attemps, :terminate, :restart

  def initialize
    @attemps = 12
    @terminate = false
    @restart = false
  end

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

  def game_start(current_secret)
    puts "\nSecret code live.\n\nTurns left:#{attemps}" if current_secret
  end

  def feedback_zero
    puts "\tZero coincidences"
  end

  def relative_fedback
    puts "\tColor missplaced"
  end

  def absolute_feedback
    puts "\tColor properly placed"
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
