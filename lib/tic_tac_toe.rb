WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [6,4,2],
  [0,3,6],
  [1,4,7],
  [2,5,8]
  ]

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if(index < 0 || index > 9 || index == nil)
    return FALSE
  elsif(position_taken?(board, index))
    return FALSE
  else
    return TRUE
  end
  
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
  
  return board
end

def input_to_index(i)
  return (i.to_i - 1)
end

def move(board, ind, arg)
  board[ind] = arg
  return board
end

def won?(board)
    WIN_COMBINATIONS.each do |win_combo|
      if(board[win_combo[0]].upcase == "X" && board[win_combo[1]].upcase == "X" && board[win_combo[2]].upcase == "X" )
      return win_combo
      elsif (board[win_combo[0]].upcase == "O" && board[win_combo[1]].upcase == "O" && board[win_combo[2]].upcase == "O" )
        return win_combo
      end
    end
  return false
end

def full?(board)
  return (!((board.include?(" ")) || (board.include?(""))))
end

def draw?(board)
  return (full?(board) && (!(won?(board))))
end

def over?(board)
  return (won?(board) || full?(board) || draw?(board))  
end

def winner(board)
  if(won?(board))
    return (board[won?(board)[0]])
  else
    return nil
  end
end

def turn(board)
  puts "Please enter 1-9?"
  input = gets.strip
  i = input_to_index(input)
  puts "Moving to index - #{i}"
  if(valid_move?(board, i))
    return display_board(move(board, i, current_player(board)))
  else
    turn(board)
  end
end

def turn_count(board)
  idx = 0
  board.each do |index|
    if(!((index == " ") || (index == "")))
      idx += 1
    end
  end
  return idx
end

def current_player(board)
  if(turn_count(board) % 2 == 0)
    return "X"
  else
    return "O"
  end
end

#def play(board) 
#  until over?(board)
#   turn(board)
#  end
#  if(won?(board))
#    puts "Congratulations #{winner(board)}!"
#  else
#    puts "Cat's Game!"
#  end
#end

def play(board) 
  curr_board = board
  loop do
   board = turn(board)
   if(over?(board))
     break
   end
  end
  if(won?(curr_board))
    puts "Congratulations #{winner(curr_board)}!"
  else
    puts "Cat's Game!"
  end
end



