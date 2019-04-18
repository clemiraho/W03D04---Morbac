class Board
  attr_accessor :grid

  def initialize

    #grille 9 cases 
  @grid = [*1..9]

  end

    #management grille
 def screen
   puts "#{@grid[0..2].join(" | ")}"
   puts "--|---|--"
    puts "#{@grid[3..5].join(" | ")}"
    puts "--|---|--"
    puts "#{@grid[6..9].join(" | ")}"

end

    #possibilité de victoire
  def victory?
    grid[0] == grid[1] && grid[1] == grid[2] ||
    grid[3] == grid[4] && grid[4] == grid[5] ||
    grid[6] == grid[7] && grid[7] == grid[8] ||
    grid[0] == grid[3] && grid[3] == grid[6] ||
    grid[1] == grid[4] && grid[4] == grid[7] ||
    grid[2] == grid[5] && grid[5] == grid[8] ||
    grid[0] == grid[4] && grid[4] == grid[8] ||
    grid[2] == grid[4] && grid[4] == grid[6]
  end
end