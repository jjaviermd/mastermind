%w[./pc_player ./human_player ./game ./colors_module].each { |file| require file }

player = HumanPlayer.new
ia = PcPlayer.new
game = Game.new
