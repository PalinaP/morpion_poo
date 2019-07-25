class Board

	attr_accessor :boardcase_array, :boardcase1, :boardcase2, :boardcase3, :boardcase4, :boardcase5, :boardcase6, :boardcase7, :boardcase8, :boardcase9
	attr_accessor :boardcase_value, :boardcase_id

# ----------------

	def initialize

		@boardcase_array = []

		@boardcase_array[0] = Boardcase.new(" ","A1")
		@boardcase_array[1] = Boardcase.new(" ","A2")
		@boardcase_array[2] = Boardcase.new(" ","A3")
		@boardcase_array[3] = Boardcase.new(" ","B1")
		@boardcase_array[4] = Boardcase.new(" ","B2")
		@boardcase_array[5] = Boardcase.new(" ","B3")
		@boardcase_array[6] = Boardcase.new(" ","C1")
		@boardcase_array[7] = Boardcase.new(" ","C2")
		@boardcase_array[8] = Boardcase.new(" ","C3")

	end # fin méthode initialize 


# ----------------

	def show_id
		puts "","| #{@boardcase_array[0].boardcase_id} | #{@boardcase_array[1].boardcase_id} | #{@boardcase_array[2].boardcase_id} |"
		puts "","| #{@boardcase_array[3].boardcase_id} | #{@boardcase_array[4].boardcase_id} | #{@boardcase_array[5].boardcase_id} |"
		puts "","| #{@boardcase_array[6].boardcase_id} | #{@boardcase_array[7].boardcase_id} | #{@boardcase_array[8].boardcase_id} |"

	end # fin méthode show_id

# ----------------

	def is_full?
		# le jeu n'est pas terminé tant qu'il reste au moins une case vide
		# on vérifie s'il y a au moins une case vide
		@boardcase_array.each {|element| 
			if element.boardcase_value == " "
				return false
				exit
			end
		}
		# s'il n'y a aucune case vide la grille est pleine
		return true

	end # fin méthode is_not_full?

# ----------------

	def three_tokens_aligned?(value_X_O) # un joueur a gagné s'il a aligné trois de ses pions. Il y a 8 possibilités. 
		if @boardcase_array[0].boardcase_value == value_X_O && @boardcase_array[1].boardcase_value == value_X_O && @boardcase_array[2].boardcase_value == value_X_O 
			return true
		elsif @boardcase_array[3].boardcase_value == value_X_O && @boardcase_array[4].boardcase_value == value_X_O && @boardcase_array[5].boardcase_value == value_X_O 
			return true
		elsif @boardcase_array[6].boardcase_value == value_X_O && @boardcase_array[7].boardcase_value == value_X_O && @boardcase_array[8].boardcase_value == value_X_O 
			return true
		elsif @boardcase_array[0].boardcase_value == value_X_O && @boardcase_array[3].boardcase_value == value_X_O && @boardcase_array[6].boardcase_value == value_X_O 
			return true
		elsif @boardcase_array[1].boardcase_value == value_X_O && @boardcase_array[4].boardcase_value == value_X_O && @boardcase_array[7].boardcase_value == value_X_O 
			return true
		elsif @boardcase_array[2].boardcase_value == value_X_O && @boardcase_array[5].boardcase_value == value_X_O && @boardcase_array[8].boardcase_value == value_X_O 
			return true
		elsif @boardcase_array[0].boardcase_value == value_X_O && @boardcase_array[4].boardcase_value == value_X_O && @boardcase_array[8].boardcase_value == value_X_O 
			return true
		elsif @boardcase_array[6].boardcase_value == value_X_O && @boardcase_array[4].boardcase_value == value_X_O && @boardcase_array[2].boardcase_value == value_X_O 
			return true
		else
			return false
		end

	end # fin méthode iplayer_won?

# ----------------

	def update (player_id_choice, value_X_O)
		# on vérifie que la case choisie par le joueur est bien vide
		@boardcase_array.each {|element| 
			if element.boardcase_id == player_id_choice
				element.boardcase_value = value_X_O
				break
			end
		}

	end # fin méthode update

# ----------------

	def is_case_correct?(player_id_choice)
		# on vérifie que l'id de la case est correcte
		if ["A1", "A2", "A3","B1", "B2", "B3","C1", "C2", "C3"].include? player_id_choice
			# si l'id est correcte, on vérifie que la case choisie par le joueur est bien vide
			@boardcase_array.each {|element| 
				if element.boardcase_id == player_id_choice && element.boardcase_value != " "
						puts "Hey! Cette case est déjà prise! Choisissez-en une vide."
						return false
						exit
				end
			}
			return true
		else
			puts "Hey! Ceci n'est pas une valeur valable! Rentre un numéro de case de type A1, A2 etc."
			return false
		end

	end # fin méthode update

# ----------------

	def show
		puts "","| #{@boardcase_array[0].boardcase_value} | #{@boardcase_array[1].boardcase_value} | #{@boardcase_array[2].boardcase_value} |"
		puts "","| #{@boardcase_array[3].boardcase_value} | #{@boardcase_array[4].boardcase_value} | #{@boardcase_array[5].boardcase_value} |"
		puts "","| #{@boardcase_array[6].boardcase_value} | #{@boardcase_array[7].boardcase_value} | #{@boardcase_array[8].boardcase_value} |"

	end # fin méthode show

# ----------------

	def clear

		# on réinitialise toutes les cases du plateaux à vide " " 
		# appelé à chaque début de partie
		@boardcase_array[0] = Boardcase.new(" ","A1")
		@boardcase_array[1] = Boardcase.new(" ","A2")
		@boardcase_array[2] = Boardcase.new(" ","A3")
		@boardcase_array[3] = Boardcase.new(" ","B1")
		@boardcase_array[4] = Boardcase.new(" ","B2")
		@boardcase_array[5] = Boardcase.new(" ","B3")
		@boardcase_array[6] = Boardcase.new(" ","C1")
		@boardcase_array[7] = Boardcase.new(" ","C2")
		@boardcase_array[8] = Boardcase.new(" ","C3")

	end # fin méthode clear

# ----------------


end # fin class Board