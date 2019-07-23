class Game
	attr_accessor :human_player, :enemies

	def initialize(name_to_save)
		@human_player = HumanPlayer.new(name_to_save)
		@enemies = [player_1 = Player.new("Zombie1"),player_2 = Player.new("Zombie2"),
		player_3 = Player.new("Zombie3"),player_4 = Player.new("Zombie4")]
		is_still_ongoing?
	end

	def kill_player(enemies_to_kill)
		@enemies.each do |enemie|
			if enemie == enemies_to_kill
			@enemies.delete(enemie)
			puts " #{enemie.name} a été tué."
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
			puts "#{n} - enemie.show_state"
			n += 1 
		end
	end

	def menu_choice(result_choice)
		if result_choice == "a"
			@human_player.search_weapon
		elsif result_choice == "s"
			@human_player.search_health_pack
		elsif result_choice == "1"
			@human_player.attacks(@enemies[0])
			if @enemies[0].life_points == 0
				kill_player(@enemies[0])
		elsif result_choice == "2"
			@human_player.attacks(@enemies[1])
			if @enemies[1].life_points == 0
				kill_player(@enemies[1])			
		elsif result_choice == "3"
			@human_player.attacks(@enemies[2])
			if @enemies[2].life_points == 0
				kill_player(@enemies[2])
		elsif result_choice == "4"
			@human_player.attacks(@enemies[3])
			if @enemies[3].life_points == 0
				kill_player(@enemies[3])






end





