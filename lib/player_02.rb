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

class HumanPlayer < Player
    attr_accessor :weapon_level, :life_points

    def initialize(name)
        super(name)
        @weapon_level = 1
        @life_points = 100

    end

    def show_state
        if life_points > 0 
            puts "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}."
        else life_points <= 0
            puts "Le joueur #{name} a été tué."
        end
    end

    def compute_damage
        return rand(1..6) * @weapon_level
    end

    def search_weapon
        new_weapon = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{new_weapon}"
        if new_weapon > @weapon_level
            @weapon_level = new_weapon
            puts "Trop bien cette nouvelle arme est meilleure que l'actuelle ! Tu la garde."
            return @weapon_level
        elsif
            puts "Diantre, cette nouvelle arme n'est pas meilleure que l'actuelle ! Tu la laisse."
        end
    end

    def search_health_pack
        health_pack = rand(1..6)
        if health_pack == 1
            puts "Pas de chance, tu n'as pas trouvé de points de vie.. retente ta chance une autre fois."
        elsif health_pack.between?(2,5)
            puts "Trop bien, tu as trouvé 50 points de vie."
            if life_points <= 50
                return @life_points = life_points + 50
            elsif life_points.between?(51,100)
                return @life_points = 100
            elsif life_points == 100
                return @life_points
            end
        elsif health_pack == 6
            puts "Trop bien, tu as trouvé 80 points de vie."
            @life_points = life_points + 80
            if life_points <= 20
                return @life_points = life_points + 80
            elsif life_points.between?(21,100)
                return life_points = 100
            elsif life_points == 100
                return @life_points
            end
        end
    end
end