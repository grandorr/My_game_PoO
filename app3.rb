require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


def perform
	puts " Bienvenue dans mon super jeu !!! "
	puts " Appuie sur une touche quand tu es pret"
	gets.chomp 
	puts " Très bien, let's go "
	puts " Quel est le nom que tu veux donner à ton personnage ?"
	name_user = gets.chomp

	my_game = Game.new(name_user)     # Crée une instance de class Game 

	while my_game.is_still_ongoing? == false  #Boucle while tant qu'il reste des monstres ou tant qu'il reste des pdv à l'utilisateur.
		puts "__________________________________________"
		my_game.new_players  # Jet de dès pour savoir si on ajoute un monstre au tableau 
		my_game.show_players # Affiche l'état de l'utilisateur & le nombre de monstre en combat
		my_game.menu # Affiche le menu 
		my_game.menu_choice(gets.chomp) # Permet de réagir au menu 
		my_game.enemies_attack # Les monstres attaquent l'utilisateur 
	end
	my_game.end  # Affiche le résultat final ( gagner/perdre )
end


perform # Lance la méthode perform qui lance le jeu :) 
