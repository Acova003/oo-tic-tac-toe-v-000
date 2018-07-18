
class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
    ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    @index =  user_input.to_i - 1
  end
  def move(index, token = "X")
    @index = index
    @board[index] = current_player
  end

  def position_taken?
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?
    @index.between?(0,8) && !position_taken?
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    @index = input_to_index
    if valid_move?
      move
      display_board
    else 
      puts "Invalid input. Please try again."
      turn(@board)
    end
  end 
  
  def turn_count
    counter = 0 
    @board.each { |turn| counter +=1 if turn != " " }
    counter
  end
  
  def current_player
    if turn_count % 2 == 0 
      return "X"
    else 
      return "O"
    end
  end
  
  def won?
    WIN_COMBINATIONS.any? do |index| 
  
    if @board[index[0]] == "X" && 
      @board[index[1]] == "X" && 
      @board[index[2]] == "X" || 
      @board[index[0]] == "O" && 
      @board[index[1]] == "O" && 
      @board[index[2]] == "O"
      return index
    else
      false
    end
  end
  end
  
  def full?
    if @board.any? {|i| i == " "}
      false
    else
      true
    end
  end
  
  def draw?
    !won?(@board) && full?(@board)
  end 
  
  def over?
    won?(@board) || draw?(@board)
  end
  
  def winner
    if won?(@board)
       winning_line = won?(@board)
       return @board[winning_line[0]]
    end
  end
  
  def play
    while !over?(@board)
      turn(@board)
    end
    if won?(@board)
      puts "Congratulations #{winner(@board)}!"
    else
      puts "Cat's Game!"
    end
  end
end 