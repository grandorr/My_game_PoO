require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

p "------------------------------------------------"
p "|Bienvenue dans le jeu de combat ultime !!!     |"
p "|Le but du jeu est d'être le dernier survivant !|"
p "-------------------------------------------------"
enemies = []
puts " Quel est votre nom?"
name_human_player = gets.chomp
user = HumanPlayer.new("#{name_human_player}")
player_1 = Player.new("Josiane")
player_2 = Player.new("José")
enemies << player_1
enemies << player_2
victory = 0 

while victory == 0    # Bloque l'user dans un while tant que le jeu n'est pas terminé 
	check_dead = 0
	while check_dead == 0 # Bloque l'user dans un while tant qu'il ne répond pas correctement au menu
		user.show_state
		puts "Quelle action veux-tu effectuer?"
		puts " a - chercher une meilleure arme"
		puts " s - chercher à se soigner ", ""
		puts "attaquer un joueur en vue :"
		print " 0 -"
		puts "#{player_1.show_state} "
		print " 1 -"
		puts "#{player_2.show_state} "

		choice = gets.chomp
		if choice == "a"
			user.search_weapon  # Cherche une arme pour l'user 
			check_dead = 1
		elsif choice == "s"
			user.search_health_pack  # Cherche de la vie pour l'user 
			check_dead = 1			
		elsif choice == "0"
			if player_1.life_points == 0  # Si l'user veut attaquer un player qui est mort, il reviens au menu ...
			  puts " Ce joueur est mort ... "
			else 
			user.attacks(player_1)
			puts "#{player_1.show_state}"
			check_dead = 1
			end

		elsif choice == "1"
			if player_2.life_points == 0 #Si l'user veut attaquer un player qui est mort, il reviens au menu ...
			  puts " Ce joueur est mort ... "
			else 
			user.attacks(player_2)
			puts "#{player_2.show_state}"
			check_dead = 1
			end
		end
	end




	if user.life_points == 0    # Perdu 
		puts " Looser tu as perdu..."
	break
	elsif player_1.life_points == 0 && player_2.life_points == 0    # Gagné ! 
	puts "BRAVO !! TU AS GAGNE "
	break
  end
  puts " Appuier sur une touche pour continuer"  # Petite pause pour que l'user ai le temps de voir le résultat de son choix.
  gets.chomp
  puts " "
	puts "______________________________________"
	puts " C'est maintenant au tour de l'ennemie."    
	puts " "

	enemies.each do |enemie|     # Ennemies attaque l'user 
		if enemie.life_points != 0
		enemie.attacks(user)
		else 
		puts "#{enemie.name} est mort et ne peux plus attaquer ..."

		end
	end
end


