require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/board'
require_relative 'lib/boardcase'


# initialisation du jeu (création de la grille et des joueurs)
my_game = Game.new
my_game.first_player
new_game = true

# tant que les joueurs relancent une partie on recommence l'ensemble du jeu
while new_game == true
	# tant que la partie n'est pas terminée on lance un tour
	# chaque joueur pose un pion sur la grille à tour de rôle
	while my_game.is_still_going?
		# un tour : un joueur pose un pion sur la grille
		my_game.play_turn
		# on vérifie si le joueur a gagné
		if my_game.player_won? == true
			#on arrête la partie
			# on change de joueur pour le prochain tour si les joueurs veulent relancer une partie
		  my_game.change_player
			break
		end
		# on change de joueur pour le prochain tour
		my_game.change_player
	end

	new_game = my_game.launch_new_game?

end



