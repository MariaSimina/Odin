class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Board
  @@positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  @@winning_combinations = [[0, 4, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 1, 2], [3, 4, 5], [6, 7, 8], [2, 4, 6]]

  def display_board
    puts "\n"
    puts "#{@@positions[0]}|#{@@positions[1]}|#{@@positions[2]}"
    puts "#{@@positions[3]}|#{@@positions[4]}|#{@@positions[5]}"
    puts "#{@@positions[6]}|#{@@positions[7]}|#{@@positions[8]}"
    puts "\n"
  end

  def update_board(choice, symbol)
    @@positions.map! {|number| (number == choice)? number = symbol : number = number}
  end

  def tie?
    @@positions.none? {|number| number.is_a? Integer}
  end

  def win?
    @@winning_combinations.any? do |combo|
      [@@positions[combo[0]], @@positions[combo[1]], @@positions[combo[2]]].uniq.length == 1
    end
  end
end

class Game
  @@player1 = Player.new("X")
  @@player2 = Player.new("O")
  @@current_player = nil
  
  def get_choice(game, player)
    puts "Chose a position by writing a number:"
    choice = gets.chomp
    game.update_board(choice.to_i, player.name)
  end

  def switch_players
    if @@current_player == @@player1
      @@player2
    else
      @@player1
    end
  end

  def play
    win = false
    game = Board.new
    @@current_player = @@player1
    game.display_board

    until win == true
      get_choice(game, @@current_player)
      game.display_board
      
      if game.tie?
        puts "It's a tie!"
        win = true
      elsif game.win?
        puts "Game Over! #{@@current_player.name} wins!"
        win = true
      end

      @@current_player = switch_players
    end
  end
end

def tic_tac_toe
  game = Game.new
    game.play
end

tic_tac_toe()
