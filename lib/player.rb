class Player 
	attr_accessor :name, :life_points
@@tab_player = []
	def initialize(name_to_save)
		@name = name_to_save
		@life_points = 10
		@@tab_player << self

	end

	def show_state
			print "#{@name} a #{@life_points} points de vie"
	end

	def gets_damage(attack_value)
		@life_points -= attack_value
		if @life_points <= 0 
			@life_points = 0 
			return " Le joueur #{self.name} a été tué !"

		end
	end

	def attacks(player_attacked)
		puts "Le joueur #{@name} attaque le joueur #{player_attacked.name}"
		attack_power = compute_damage
		puts "Il lui inflige #{attack_power} points de dommages"
		player_attacked.gets_damage(attack_power)

	end


	def compute_damage
    return rand(1..6)
  end



end


class HumanPlayer < Player 
	attr_accessor :weapon_level 

	def initialize(name_to_save)
		@name = name_to_save
		@life_points = 100
		@weapon_level = 1 
	end 

	def show_state
		puts "#{@name} a #{@life_points} points de vie et son arme est niveau #{@weapon_level}. " 
	end

	def compute_damage
    return rand(1..6) * @weapon_level
  end

  def search_weapon
  	weapon_search = rand(1..6)
  	puts " Tu as trouvé une arme de niveau #{weapon_search}"
  	if weapon_search > @weapon_level
  		puts "Uhhhh tu as trouvé une meilleure arme !!!"
  		puts " Tu la prend et tu jette l'ancienne..."
  		@weapon_level = weapon_search
  	else 
  		puts "Et non tu ne trouve pas mieux... "
  	end
  end

  def search_health_pack
  	search_health = rand(1..6)
  	if search_health == 1
  		puts " Fuckk, rien trouvé ..."
  	elsif search_health > 1 && search_health < 6
  		puts "Bravo, tu as trouvé un pack de +50 points de vie !"
  		@life_points += 50 
  		if @life_points > 100 
  			@life_points = 100 
  		end
  		puts " Tu as maintenant #{@life_points} points de vie "
  	elsif search_health == 6 
  		puts " Woooaaaawwww, tu a trouvé un pack de +80 points de vie ! "
  		@life_points += 80
  		if @life_points > 100
  			@life_points = 100
  		end
  		puts " Tu as maintenant #{@life_points} points de vie "
  	end
  end
end



