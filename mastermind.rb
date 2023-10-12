class Player
  def initialize
    @pegs = ["red", "green", "blue", "yellow", "white", "black"]
  end

  def random_choice
    @code = @pegs.sample(4)
  end

  def choose_row
    puts "Choose a row of 4 colors between red, green, blue, yellow, white, black."
    @colors_row = gets.chomp
    @colors_row = @colors_row.split(" ")
    if (@pegs - @colors_row).length > 2
      puts "Invalid choice"
      choose_row
    else
      @colors_row
    end
  end
end

class Game
  def initialize
    @code = nil
    @guess = nil
    @tries = 0
  end

  def keys
    red_keys = 0
    white_keys = 0
    @code.each_with_index do |choice, index|
      @guess.each_with_index do |color, position|
        if (choice == color) && (index == position)
          red_keys += 1
        elsif (choice == color) && (index != position)
          white_keys += 1
        end
      end
    end
    puts "white keys: #{white_keys}" + "\n" + "red keys: #{red_keys}"
  end

  def check_guess
    if @guess == @code
      puts "You won!"
      @tries = 12
    else
      keys
      @tries += 1
    end
  end

  def play
    new_player = Player.new
    puts "What would you like to do? Please choose between: 'choose the code' and 'guess the code'."
    player = gets.chomp
    if player == "guess the code"
      @code = new_player.random_choice
      until @tries == 12 do
        @guess = new_player.choose_row
        check_guess
      end
    elsif player == "choose the code"
      @code = new_player.choose_row
      until @tries == 12 do
        @guess = new_player.random_choice
        check_guess
      end
    else
      puts "Invalid choice"
      play
    end
  end
end

game = Game.new
game.play
