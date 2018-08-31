  #Helper Methods
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
def input_to_index(user_input)
  #no check on user_input, just subtract 1
  user_input.to_i - 1
end
def move(board, index, current_player = "X")
  #assumes position_taken? = no, and valid_move? = yes, and index is valid
  board[index] = current_player
end
def position_taken?(board, location)
  board[location] != " " && board[location] != "" && board[location] != nil
end
def valid_move?(board, index)
  if !index.between?(0,8)
    puts "[valid_move]: Invalid index:  #{index}"
  end

  if position_taken?(board, index)
    puts "[valid_move]: Position taken:  #{index}"
  end

  return (index.between?(0,8) && !position_taken?(board, index))
end
# Define your play method below
def get_input(token)
  print "Player #{token} select an unused cell:  [1-9]:  "
  input = gets.strip
  puts ""
  return input
end
def get_new_token(token)
  if token == 'X'
    return 'O'
  else
    return 'X'
  end
end
def play(board)
  turn = 1
  token = 'X'
  while turn <= 9
    display_board
    input = get_input(token)
    index = input_to_index(input) #just subtracts 1 from any value
    if (valid_move?(board, index))
      move(board, index, token)
      token = get_new_token(token)
      turn += 1
    end
  end
end
