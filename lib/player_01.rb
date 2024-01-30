require 'pry'

class Player
    attr_accessor :name, :life_points
    
    def initialize(name)
        @name = name
        @life_points = 10
    end

    def show_state
        if life_points > 0 
            puts "#{name} a #{life_points} points de vie."
        else life_points <= 0
            puts "Le joueur #{name} a été tué."
        end
    end

    def gets_damage(damage)
        @life_points = life_points - damage

    end

    def compute_damage
        return rand(1..6)
    end

    def attacks(player_to_attack)
        puts "#{name} attaque #{player_to_attack.name}"
        damage = compute_damage
        puts "Il lui inflige #{damage} de dégats"
        player_to_attack.gets_damage(damage)
        puts
    end

end



