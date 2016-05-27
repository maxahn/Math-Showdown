#JUST BRAIN JUNK AS I THINK THIS THROUGH
#set up data structures to represent each player and how many lives they have 
#create a loop 
#the loop must: 
#print out questions (look up random number generation within a range like 1-20)
#save the answer for the addition question for later comparison
#take in user input
#if user input is correct loop again back to printing the question
#if user input is wrong, subtract from current player's health and check if the health is at zero yet
#if it is, end loop and declare game over
#It should also be kept in mind that this will be alternating between the players 

puts "PLAYER ONE, ENTER YOUR NAME... IF YOU DARE!"
name_one = gets.chomp.capitalize

puts "PLAYER TWO! ENTER YOUR NAME AS WELL, YOU FOOLISH MORTAL!"
name_two = gets.chomp.capitalize
@player_one = {
  name:  name_one, 
  lives_remaining: 3
}

@player_two = {
  name: name_two,
  lives_remaining: 3
}


def start_game 
  round_num = 1
  game_over = false 
  current_player = @player_one   #will keep track which player's turn it is

  while !game_over
    random_num_one = rand(20) 
    random_num_two = rand(20)
    answer = (random_num_one + random_num_two).to_s 

    puts "Round #{round_num}! #{current_player[:name]}, what is #{random_num_one} plus #{random_num_two}!?"
    
    player_answer = gets.chomp
    
    if player_answer == answer
      puts "CORRECT! Congratulations, you get to live another round, #{current_player[:name]}!"
    else
      current_player[:lives_remaining] -= 1
      puts "WRONG ANSWER! #{current_player[:name]} loses a life and is now at #{current_player[:lives_remaining]}!" 
    end
    
    if current_player[:lives_remaining] <= 0
      puts "GAME OVER! #{current_player[:name].upcase} LOSES!"
      game_over = true
    end

    if current_player == @player_one
      current_player = @player_two
    else
      current_player = @player_one
    end
    
    if game_over == true 
      puts "#{current_player[:name].upcase} WINSSSSSSS!!!!!"
    end 
  end
end

start_game 

