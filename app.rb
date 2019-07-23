require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player_1 = Player.new("Josiane")
player_2 = Player.new("José")
# Crée 2 joueur # 
puts "Voici l'état de chaque joueur : "
puts player_1.show_state
puts player_2.show_state
# Affiche l'état de chaque joueur #
puts "Passons à la phase d'attaque."
victory = 0
while victory == 0  # Tant que le combat n'est pas terminer, continuer d'attaquer ! 
player_1.attacks(player_2)
puts " "
if player_2.life_points <= 0  # Si les pdv de player_2 sont à 0 le combat est terminé.

	puts " Voici le score final :"
	puts " "
	player_1.show_state
	player_2.show_state     # Affiche le score final #
	puts " "
	puts "#{player_1.name} a gagné !!"
	puts " _______________________________________"
	break 
end
puts "______________"
player_2.attacks(player_1)   # Joueur 2 attaque le joueur 1 
puts " "
if player_1.life_points <= 0  # Si les pdv de player_1 sont à 0 le combat est terminé.

	puts "Voici le score final :"
	puts "   "
	player_1.show_state
	player_2.show_state  # Affiche le score final # 
	puts " "
	puts "#{player_2.name} a gagné !! "
	puts " _______________________________________"
	break 
end

puts "______________"
puts " Voici l'état de chaque joueur :"," "
player_1.show_state # Affiche l'état de chaque joueur #
player_2.show_state # Affiche l'état de chaque joueur # 



puts " Le combat continue !! c'est tellement epic !!", " ", " "

end

