class Game
	attr_accessor :human_player, :enemies

	def initialize(name_to_save)
		@human_player = HumanPlayer.new(name_to_save)
		@enemies = [player_1 = Player.new("Zombie1"),player_2 = Player.new("Zombie2"),
		player_3 = Player.new("Zombie3"),player_4 = Player.new("Zombie4")]
		@players_left = 10
		@enemies_in_sight = []
	end

  def new_players
  	if @enemies.length != @players_left
  		dés = rand(1..6)
  		dés_name = rand(5..999)
  		if dés == 1
  			puts "Pas de nouveau monstre "
  		elsif dés > 1 && dés < 5
  			joueur_755 = Player.new("Zombie#{rand(5..999)}")
  			@enemies << joueur_755
  			puts " "
  			puts " ATTENTION "
  			puts "Un nouveau monstre rejoin le combat !"
  		elsif dés > 4 && dés < 7 
  			joueur_766 = Player.new("Zombie#{rand(5..999)}")
   			joueur_767 = Player.new("Zombie#{rand(5..999)}")
  			@enemies << joueur_766
  			@enemies << joueur_767
   			puts " 2 nouveau monstre rejoignent le combat ! "
   		end
   	end
   end


	def kill_player(enemies_to_kill)
		@enemies.each do |enemie|
			if enemie == enemies_to_kill
			@enemies.delete(enemie)
			puts " #{enemie.name} a été tué."
			@players_left -= 1 
			end
		end
	end


	def is_still_ongoing?
		if @human_player.life_points > 0 && @enemies.length > 0 
			return false
		else
			return true 
		end
	end

	def show_players
		puts @human_player.show_state
		puts "Il reste #{@enemies.length} ennemies !"
	end

	def menu
		puts "Quelle action veux-tu effectuer?"
		puts " a - chercher une meilleure arme"
		puts " s - chercher à se soigner ", ""
		puts "attaquer un joueur en vue :"
		n = 1 
		@enemies.each do |enemie|
			print " #{n} - " 
			puts "#{enemie.show_state}"
			n += 1 
		end
		puts " ATTENTION : Si tu rentre autre chose que ce qui est proposé, tu passe ton tour !!!"
	end

	def menu_choice(result_choice)
		if result_choice == "a"
			@human_player.search_weapon
			puts "Appuie sur une touche pour continuer"
			gets.chomp
		elsif result_choice == "s"
			@human_player.search_health_pack
			puts "Appuie sur une touche pour continuer"
			gets.chomp
		elsif result_choice == "1"
			@human_player.attacks(@enemies[0])
			if @enemies[0].life_points == 0
				kill_player(@enemies[0])
			end
			puts "Appuie sur une touche pour continuer"
			gets.chomp
		elsif result_choice == "2"
			@human_player.attacks(@enemies[1])
			if @enemies[1].life_points == 0
				kill_player(@enemies[1])
			end	
			puts "Appuie sur une touche pour continuer"
			gets.chomp		
		elsif result_choice == "3"
			@human_player.attacks(@enemies[2])
			if @enemies[2].life_points == 0
				kill_player(@enemies[2])
			end
			puts "Appuie sur une touche pour continuer"
			gets.chomp
		elsif result_choice == "4"
			@human_player.attacks(@enemies[3])
			if @enemies[3].life_points == 0
				kill_player(@enemies[3])
			end
			puts "Appuie sur une touche pour continuer"
			gets.chomp
		elsif result_choice == "5"
			@human_player.attacks(@enemies[4])
			if @enemies[4].life_points == 0
				kill_player(@enemies[4])
			end
			puts "Appuie sur une touche pour continuer"
			gets.chomp
		elsif result_choice == "6"
			@human_player.attacks(@enemies[5])
			if @enemies[5].life_points == 0
				kill_player(@enemies[5])
			end
			puts "Appuie sur une touche pour continuer"
			gets.chomp
		elsif result_choice == "7"
			@human_player.attacks(@enemies[6])
			if @enemies[6].life_points == 0
				kill_player(@enemies[6])
			end
			puts "Appuie sur une touche pour continuer"
			gets.chomp
		elsif result_choice == "8"
			@human_player.attacks(@enemies[7])
			if @enemies[7].life_points == 0
				kill_player(@enemies[7])
			end
			puts "Appuie sur une touche pour continuer"
			gets.chomp
		elsif result_choice == "9"
			@human_player.attacks(@enemies[8])
			if @enemies[8].life_points == 0
				kill_player(@enemies[8])
			end
			puts "Appuie sur une touche pour continuer"
			gets.chomp
		elsif result_choice == "10"
			@human_player.attacks(@enemies[9])
			if @enemies[9].life_points == 0
				kill_player(@enemies[9])
			end
			puts "Appuie sur une touche pour continuer"
			gets.chomp
		end
	end
  
  def enemies_attack
  	@enemies.each do |enemie|
  		enemie.attacks(@human_player)
  	end
  end

  def end 
  	if @human_player.life_points == 0
		puts " Looser tu as perdu..."
		elsif @enemies.empty? == true
		puts "__________________________________"
		puts " VICTOIRE !!! $$$$ "
		puts " ___________________________________"
		end
	end
end





