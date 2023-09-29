def tic_tac_toe
  winning_combinations = [[1, 5, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 2, 3], [4, 5, 6], [7, 8, 9], [3, 5, 7]]
  numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  player1_choice = []
  player2_choice = []
  i = 1
  win = false
  until win === true
    p "Please choose a position:"
    choice = gets.chomp.to_i
    numbers.each do |valid_choice|
      if choice == valid_choice
        if i % 2 == 0
          player2_choice.push(choice)
          player1_choice.sort!
        else
          player1_choice.push(choice)
          player2_choice.sort!
        end
        winning_combinations.each do |combination|
          if player1_choice == combination
            p "Player1 wins!"
            win = true
          elsif player2_choice == combination
            p "Player2 wins!"
            win = true
          end
        end
        numbers.delete(choice)
        i+=1
        if numbers.empty?
          win = true
          p "It's a draw"
        end
      else
        next
      end
    end
  end

end

tic_tac_toe
