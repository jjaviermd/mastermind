%w[./pc_player ./human_player ./game ./colors_module].each { |file| require file }

player = HumanPlayer.new
ia = PcPlayer.new
game = Game.new

puts "\nWelcome to mastermind. This version of the game allows you to play againts IA\n"
ia.set_secret_code
game.game_start(ia.secret_code)

until game.attemps <= 0 do
  player.set_guess
game.compare(player.guess, ia.secret_code)
game.turns_left if game.attemps > 0
game.retry? if game.game_over
player.clear_guess
end
