require_relative 'board' #relit le game aux deux autres fichiers
require_relative 'player' 

class Game

    def initialize
      puts "Bien le bonjour"
      puts "Prêt à déciminer des morbaques?"
      puts "-------------------------------"
  
  
      puts "Déjà le petit nom du premier contaminé:"
      print "=>"
      name1 = gets.chomp       
      @player1 = Player.new(name1, "€")
       puts "#{name1}, tu vas joué avec la force de Mario Draghi, €"
       puts "----------------------------------------------------"
  
      puts "Et le/la camarade suivant(e) son petit nom?"
      print "=>"
      name2 = gets.chomp 
        @player2 = Player.new(name2,"$")
         puts "Okay, toi tu auras le droit à un gros $, signe de la monnaie espagnole"
         puts "monnaie bien connue et utilisée dans les colonies du Nouveau-Monde"
         puts "notamment dans les territoires du Texas et de Californie"
  
     @current_player = @player1
     @board = Board.new
  
    end
  
      #methode alternance entre joueurs
    def switch_players
      if @current_player == @player1
         @current_player = @player2
      else
         @current_player = @player1
      end
    end
  
  
    def move
      puts "#{@current_player.name}, à l'aide de ton petits appendice tu dois aller contaminé une case : "
      print "=>"
      target = gets.chomp
  
          #Saisie du joueur en integer
      if target.to_i == @board.grid[target.to_i - 1]
              @board.grid[target.to_i - 1] = @current_player.symbol
      else
              #plantage si mauvais choix
      puts "Mouais, ça s'appel un plantage donc tu feras gaffe à l'avenir"
      switch_players
      end
    end
  
      #lancement jeu
    def start
      loop do
        @board.screen
        move
        if game_over?
            break
        else
            switch_players
        end
      end
        @board.screen
        if @board.victory?
          puts "Game over ! #{@current_player.name} peut se réjouir d'avoir balancé ses saloperies un peu trop partout"
        else
          puts "Fail, pathétique, minable, la loose, Patrick Chirac. Bref, c'est Bof (ou beauf)"
        end
    end
  
      #condition victoire et fin cases libres
    def game_over?
      @board.victory? || @board.grid.all? {|cell| cell.is_a? String}
    end
  end
  
  
  game = Game.new
  game.start