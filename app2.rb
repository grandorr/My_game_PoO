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

while victory == 0
	check_dead = 0
	while check_dead == 0
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
			user.search_weapon
			check_dead = 1
		elsif choice == "s"
			user.search_health_pack
			check_dead = 1			
		elsif choice == "0"
			if player_1.life_points == 0
			  puts " Ce joueur est mort ... "
			else 
			user.attacks(player_1)
			puts "#{player_1.show_state}"
			check_dead = 1
			end

		elsif choice == "1"
			if player_2.life_points == 0
			  puts " Ce joueur est mort ... "
			else 
			user.attacks(player_2)
			puts "#{player_2.show_state}"
			check_dead = 1
			end
		end
	end




	if user.life_points == 0
		puts " Looser tu as perdu..."
	break
	elsif player_1.life_points == 0 && player_2.life_points == 0 
	puts "BRAVO !! TU AS GAGNE "
	break
  end
  puts " Appuier sur une touche pour continuer"
  gets.chomp
  puts " "
	puts "______________________________________"
	puts " C'est maintenant au tour de l'ennemie."
	puts " "

	enemies.each do |enemie|
		if enemie.life_points != 0
		enemie.attacks(user)
		else 
		puts "#{enemie.name} est mort et ne peux plus attaquer ..."

		end
	end
end

puts "yes"

