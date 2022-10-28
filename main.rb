# frozen_string_literal: true
require "byebug"
%w[./pc_player ./human_player ./game ./colors_module].each { |file| require file }

def round
  player = HumanPlayer.new
  ia = PcPlayer.new
  game = Game.new

  puts "\n\nWelcome to mastermind. This version of the game allows you to play againts IA\n"
  ia.set_secret_code
  game.game_start(ia.secret_code)

  until game.attemps <= 0
    player.set_guess
    puts player.guess
    game.compare(player.guess, ia.secret_code)
    game.turns_left if game.attemps.positive?
    player.clear_guess
    game.game_over if game.attemps.zero?

    next unless game.terminate

    game.retry?
    if game.restart == true
      round
    else
      puts 'Thanks for playing'
      game_mode
    end
  end
end

def round_vs_human
  coder = HumanPlayer.new
  breaker = HumanPlayer.new
  game = Game.new

  puts "\nType the secret code"
  coder.set_guess
  puts "\nsecret code stablished. break it!"
  

  until game.attemps <= 0
    breaker.set_guess
    puts breaker.guess
    #byebug
    game.compare(breaker.guess, coder.guess)
    game.turns_left if game.attemps.positive?
    breaker.clear_guess
    if game.attemps.zero?
      game.game_over
      game.reveal_code(coder.guess)
    end

    next unless game.terminate

    game.retry?
    if game.restart == true
      round
    else
      puts 'Thanks for playing'
      game_mode
    end
  end
end

def game_mode 
  puts "Enter mode"
  ask_mode = gets.chomp.to_i
  case ask_mode
    when 1
      call round
    when 2
      call round_vs_human
    else
      mode = 3
      puts "closing..."
      exit
  end
end


puts %q{Welcome to Mastermind.
    If you want to set a secret code for someone else to break it: press 1.
    If you want a ramdonly created secret code: press 2
    Any other number: exit}

game_mode
