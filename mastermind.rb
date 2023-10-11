class Board
  attr_reader :pegs

  def initialize
    @pegs = ["red", "green", "blue", "yellow", "white", "black"]
  end

  def create_code
    @code = @pegs.sample(4)
  end
end

class Game
  def initialize
    @board = choose_role
    @code = @board.create_code
    @new_row = []
  end

  def choose_role
    puts "What would you like to do, chose the code or guess the code?"
    puts "Please chose between: 'chose the code' and 'guess the code'."
    player = gets.chomp
    if player == "guess the code"
      Board.new
    elsif player == "chose the code"
      Player.new
    else
      puts "Invalid choice"
      choose_role
    end
  end

  def guess_color
    puts "Choose a color"
    color = gets.chomp
    if @board.pegs.none? {|choice| color == choice}
      guess_color
    else
      @new_row << color
    end
  end

  def get_row
    @new_row = []
    4.times {guess_color}
    p @new_row
  end

  def keys
    red_keys = 0
    white_keys = 0
    @code.each_with_index do |choice, index|
      @new_row.each do |color, position|
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
    if @new_row == @code
      puts "You won!"
    else
      keys
      puts "\n" + "Try again!"
      get_row
      check_guess
    end
  end

  def play
    p @code
    get_row
    check_guess
  end
end

class Player < Board

  def create_code
    puts "Enter code bellow:"
    @code = gets.chomp
    @code = @code.split(" ")
  end
end

game = Game.new
game.play