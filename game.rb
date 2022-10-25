
%w[./pc_player ./human_player].each { |file| require file}


class Game
    attr_reader :attemps, :terminate

    def initialize
      @attemps = 12
      @terminate = false
    end

    def compare(a,b)
      @attemps -= 1
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


    def game_start(current_secret)
      if current_secret
        puts "\nSecret code live.\n\nTurns left:#{attemps}"
      end
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
    end

    def turns_left
      puts "\n#{self.attemps} attemps left"
    end

    def game_over
        @terminate = true
        puts "Game over!"
    end

    def retry?
      puts %q[Retry?
        Y -yes
        N - no]
      response = gets.chomp
     if response == "y"
      return true
     elsif response == "n"
      return false
     else
      puts "Type y or n please"
      retry?
     end
    end


end
