require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
puts " Bienvenue dans mon super jeu !!! "
puts " Appuie sur une touche quand tu es pret"
gets.chomp
puts " Très bien, let's go "
puts " Quel est le nom que tu veux donner à ton personnage ?"
name_user = gets.chomp
my_game = Game.new(name_user)
while my_game.is_still_ongoing? == false
	puts "__________________________________________"
	my_game.show_players
	my_game.menu 
	my_game.menu_choice(gets.chomp)
	my_game.enemies_attack
end
my_game.end
