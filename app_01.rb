require 'bundler'
Bundler.require

require_relative 'lib/game_01'
require_relative 'lib/player_01'

player1 = Player.new("Josiane")
player2 = Player.new("José")
puts "Voici l'état de nos joueurs : "
puts "#{player1.show_state}"
puts "#{player2.show_state}"

while player1.life_points > 0 && player2.life_points > 0
    puts "Passons à la phase d'attaque : "
    player1.attacks(player2)
    if player2.life_points <= 0
        puts "#{player2.show_state}"
        break
    end
    player2.attacks(player1)
    puts "Voici l'état de nos joueurs : "
    puts "#{player1.show_state}"
    puts "#{player2.show_state}"

end



