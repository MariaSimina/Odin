class Board
  attr_reader :new_row, :pegs

  def initialize
    @pegs = ["red", "green", "blue", "yellow", "white", "black"]
  end

  def create_code
    @code = @pegs.sample(4)
  end
end

class Game
  def initialize
    @board = Board.new
    @code = @board.create_code
    @new_row = []
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

game = Game.new
game.play