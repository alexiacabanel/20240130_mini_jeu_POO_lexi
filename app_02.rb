require 'bundler'
Bundler.require

require_relative 'lib/game_02'
require_relative 'lib/player_02'

player1 = Player.new("Josiane")
player2 = Player.new("José")
ennemies = [player1, player2]

def acceuil
    puts "¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤"
    puts "¤                                    Bienvenue sur 'ILS VEULENT TOUS MA POO'                                             ¤"
    puts "¤                                Le but du jeu est d'être le dernier survivant.                                          ¤"
    puts "¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤"
end

acceuil

def create_human_player
    puts "Quel est votre prénom ?"
    name = gets.chomp
    name = HumanPlayer.new(name)
    return name
end

name = create_human_player

def menu(player1, player2)
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "attaquer un joueur en vue :"
    puts "x -" 
    print "#{player1.show_state}"
    puts "y -"
    print "#{player2.show_state}"
    puts
    action = gets.chomp
end


def combat(name, player1, player2, ennemies)
    while name.life_points > 0 && player1.life_points > 0 || player2.life_points >0
        puts "#{name.show_state}"
        case menu(player1, player2)
        when "a"
            name.search_weapon
        when "s"
            name.search_health_pack
        when "x"
            name.attacks(player1)
        when "y"
            name.attacks(player2)
        end
        puts
        ennemies.each do |atk|
            if atk.life_points > 0
                puts
                puts "#{atk.name} vous attaque :"
                atk.attacks(name)
            else
                puts "#{atk.name} a été tué"
            end
        end
        if name.life_points <= 0
            puts "#{name.show_state}"
            break
        end
    end
    puts
    puts
    puts "Partie terminée."
    if name.life_points <= 0
        puts "GAME OVER"
    else
        puts "Bravo, tu as gagné."
    end
end

combat(name, player1, player2, ennemies)