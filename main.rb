# frozen_string_literal: true

%w[./pc_player ./human_player ./game ./colors_module].each { |file| require file }

def round
  player = HumanPlayer.new
  ia = PcPlayer.new
  game = Game.new

  puts "\nWelcome to mastermind. This version of the game allows you to play againts IA\n"
  ia.set_secret_code
  game.game_start(ia.secret_code)

  until game.attemps <= 0
    player.set_guess
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
      break
    end
  end
end

round
