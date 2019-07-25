class Game

	attr_accessor :player1, :player2, :board, :player_turn

# ----------------

	def initialize

		system("clear")
	  # Display welcome message
	  puts "      -----------***---------------------***-----------"
	  puts "     ---------------------------------------------------"
		puts "    |              Bienvenue sur votre jeu             |"
		puts "    |                      MORPION                     |"
		puts "     ---------------------------------------------------"
		puts "      ------------------**************-----------------"

		# initialisation des joueurs
		# chaque joueur choisi un nom
    puts "","Choisissez le nom du premier joueur:"
    name = gets.chomp
		@player1 = Player.new(name, "X")
		puts "","Choisissez le nom du deuxième joueur:"
    name = gets.chomp
		@player2 = Player.new(name, "O")

		puts "","C'est parti! #{@player1.name} et #{@player2.name}, indiquez à tour de rôle le numéro de case dans laquelle vous souhaitze poser un pion (A1, A2, A3 etc.)"
		
		# affichage du plateau avec le numéro des cases
		@board = Board.new
		@board.show_id

		puts "","#{@player1.name} vous aurez les pions X"
		puts "#{@player2.name} vous aurez les pions O"

	end # fin méthode initialize

# ----------------

	def play_turn
		# on récupère le choix du joueur
		puts "","#{@player_turn.name}, dans quelle case voulez poser un pion?"
		player_id_choice = gets.chomp

		# on demande au joueur de rentrer une nouvelle case tant que celle-ci n'est pas correcte
		while @board.is_case_correct?(player_id_choice) == false
			player_id_choice = gets.chomp
		end

		# on met à jour la grille avec l'entrée choisie par le joueur
		# si c'est le tour du joueur1 on passe "X", si c'est le tour du joueur2 on passe "O"
		value_X_O = @player_turn.token	
		@board.update(player_id_choice, value_X_O)

		# on affcihe la grille du MORPION mis à jour
		@board.show

	end # fin méthode play_game

# ----------------

  def player_won?
		# le jeu est terminé si le joueur qui vient de poser un pion a gagné, c'est à dire s'il a réussi à aligner trois pions
		# si c'est le tour du joueur1 on passe "X", si c'est le tour du joueur2 on passe "O"
		# si le joueur a gagné on retourne true, sinon on retourne false
		value_X_O = @player_turn.token
		if @board.three_tokens_aligned?(value_X_O) == true
			puts ""
			puts "--------------------------------------------------"
			puts "*****                                       ******"
			puts "                                                  "
			puts "      Bravo #{@player_turn.name}, tu as gagné la partie!"
			puts "                                                  "
			puts "*****                                       ******"
			puts "--------------------------------------------------"
			# on incrémente le score du joueur gagnant de 1
			if @player_turn == @player1
				@player1.score = @player1.score + 1
			elsif @player_turn == @player2
				@player2.score = @player2.score + 1
			end
			return true
		else
			return false
		end	

	end

# ----------------

	def is_still_going?
		# le jeu n'est pas terminé tant qu'il reste au moins une case vide
		if @board.is_full? == false
			return true
		else
			puts ""
			puts "--------------------------------------------------"
			puts "*****                                       ******"
			puts "                                                  "
			puts "Le jeu est terminé! Tous les pions ont été placés."
			puts "            Il n'y a pas de vainqueur             "
			puts "                                                  "
			puts "*****                                       ******"
			puts "--------------------------------------------------"
			
		end

	end # fin méthode play_game

# ----------------
 
 	def first_player
		# pour la première partie on tire au sort le joueur qui commence, ensuite on alternera
		de = rand(1..2)
		de == 1 ? @player_turn = @player1 : @player_turn = @player2
		puts "","Après tirage au sort, c'est #{@player_turn.name} qui commence à jouer"
	end

# ----------------

	def change_player
		# on change de joueur à chaque coup
		if @player_turn == @player1
			@player_turn = @player2
		elsif @player_turn == @player2
			@player_turn = @player1
		end

	end # fin méthode play_game

# ----------------

	def launch_new_game?
		puts "","----  DO YOU WANT TO PLAY AGAIN ?  (y/n)  -----"
		player_yn_choice = gets.chomp

		# on vérifie que la réponse de l'utilisateur est correcte. Tant que ce n'est pas le cas on lui demande d'en entrer une nouvelle
		until ["y", "n", "Y","N"].include? player_yn_choice
			puts "Ceci n'est pas une valeur valable! Répondez par y/n."
			player_yn_choice = gets.chomp
		end

		# si l'utilisateur veut faire une nouvelle partie, on affiche le score des deux joueurs et on lance une nouvelle partie
		if player_yn_choice == "y" or player_yn_choice == "Y"
			puts "","C'est parti pour un nouveau tour!"
			puts "SCORE #{player1.name} = #{player1.score} partie(s) gagnée(s)"
			puts "SCORE #{player2.name} = #{player2.score} partie(s) gagnée(s)"
			# on réinitialise toutes les cases du plateaux à vide " " pour la nouvelle partie
			@board.clear
			# on rappelle les id de toutes les cases de la grille
			@board.show_id
			return true
		# si l'utilisateur veut quitter le jeu, le programme se termine avec un message d'aurevoir
		elsif player_yn_choice == "n" or player_yn_choice == "N"
			puts ""
			puts "--------------------------------------------------"
			puts "*****                                       ******"
			puts "                                                  "
			puts "          Merci d'avoir joué à MORPION !          "
			puts "                    A bientôt                     "
			puts "                                                  "
			puts "*****                                       ******"
			puts "--------------------------------------------------"
			return false
		end


	end # fin méthode new_game

# ----------------


end # fin classe Game