
# This program is a 'state quiz game' optimized for multiplayer use but also with a single-player mode
# Player(s) are asked randomly selected questions and input their answers
# The answers are checked and points are awarded for correct answers
# If a player answers incorrectly, the other player can steal the same question for bonus points
# Each question has a random chance to be a 'wildcard' question
# For a wildcard question, the player can wager the player's own points for big rewards or losses
# Safeguards are put in throughout the game to prevent common invalid inputs
# The game continues until a player has 10 points at the end of a round (or higher for a tie)
# The first player to 10 points...wins!!


# for debugging
require 'pry'

# construct State class
class State
  attr_accessor :name, :capital, :trivia
  def initialize (name, capital, trivia)
    @name = name
    @capital = capital
    @trivia = trivia
  end
end

#array of state objects
sA =  Array.new()
sA[0] =  State.new("alabama", "montgomery", "housed the original capital of the Confederate States of America")
sA[1] =  State.new("alaska", "juneau", "has the lowest population density of any state")
sA[2] =  State.new("arizona", "phoenix", "is famous for its saguaro cacti")
sA[3] =  State.new("arkansas", "little rock", "hosts the annual World Championship ‘Duck Calling’ contest and is known as ’The Natural State’")
sA[4] =  State.new("california", "sacramento", "houses Silicon Valley, the tech hub of the United States")
sA[5] =  State.new("colorado", "denver", "is the only state to lie entirely above 3,000 feet in elevation")
sA[6] =  State.new("connecticut", "hartford", "houses the PEZ candy company")
sA[7] =  State.new("delaware", "dover", "became, in 1787, the first state to ratify the United States constitution")
sA[8] =  State.new("florida", "tallahassee", "is the flattest state, with a mean elevation of about 100 feet")
sA[9] =  State.new("georgia", "atlanta", "is the largest produces of peanuts, pecans, and peaches")
sA[10] =  State.new("hawaii", "honolulu", "is the most geographically southern in the nation")
sA[11] =  State.new("idaho", "boise", "is famous for potatoes")
sA[12] =  State.new("illinois", "springfield", "was the first to ratify the 13th amendment, abolishing slavery")
sA[13] =  State.new("indiana", "indianapolis", "hosted the very first professional baseball game")
sA[14] =  State.new("kansas", "topeka", "houses the geographic center of the lower 48 states")
sA[15] =  State.new("kentucky", "frankfort", "was the birthplace of Abraham Lincoln")
sA[16] =  State.new("louisiana", "baton Rouge", "is the only state to have parishes instead of counties")
sA[17] =  State.new("maine", "augusta", "is the only one to border exactly one other state")
sA[18] =  State.new("maryland", "annapolis", "gave up land to create Washington D.C.")
sA[19] =  State.new("massachusetts", "boston", "was the Revolutionary War started in")
sA[20] =  State.new("michigan", "lansing", "is shaped like a hand")
sA[21] =  State.new("minnesota", "st. paul", "houses the Mall of America, the largest mall in the United States")
sA[22] =  State.new("mississippi", "jackson", "has an Indian name that means ‘great river of gathering waters’")
sA[23] =  State.new("missouri", "jackson", "shares its name with the longest river in the United States")
sA[24] =  State.new("montana", "helena", "has the largest grizzly bear population in the lower 48 states")
sA[25] =  State.new("nebraska", "lincoln", "has the largest hand-planted forest in America, covering nearly 150,000 acres")
sA[26] =  State.new("nevada", "carson city", "is home to Las Vegas")
sA[27] =  State.new("new hampshire", "concord", "was the first colony to declare independence from Great Britain")
sA[28] =  State.new("new jersey", "trenton", "houses Atlantic City, whose streets featured as the properties in the original game of Monopoly")
sA[29] =  State.new("new mexico", "santa fe", "has the highest concentration of PHDs?")
sA[30] =  State.new("new york", "albany", "houses the Statue of Liberty")
sA[31] =  State.new("north carolina", "raleigh", "was where the Wright brothers completed the first successful airplane flight")
sA[32] =  State.new("north dakota", "bismarck", "is the least visited state in America")
sA[33] =  State.new("ohio", "columbus", "is home to the Rock and Roll Hall of Fame")
sA[34] =  State.new("oklahoma", "oklahoma city", "has the most tornados of all US states")
sA[35] =  State.new("oregon", "salem", "is home to Crater Lake, the deepest lake in the US, which reaches nearly 2,000 feet deep")
sA[36] =  State.new("pennsylvania", "harrisburg", "is home to the Liberty Bell")
sA[37] =  State.new("rhode Island", "providence", "is the smallest state")
sA[38] =  State.new("south carolina", "columbia", "in 1860 became the first to secede from the Union, setting the stage for the Civil War")
sA[39] =  State.new("south dakota", "pierre", "is home to Badlands National Park")
sA[40] =  State.new("tennessee", "nashville", "did Elvis Presley call home")
sA[41] =  State.new("texas", "austin", "is the largest oil-producing state in the country")
sA[42] =  State.new("utah", "salt lake city", "is famous for its natural arches")
sA[43] =  State.new("vermont", "montpelier", "is the only New England state that does not border the Atlantic Ocean")
sA[44] =  State.new("virginia", "richmond", "was the location of Jamestown, the first permanent English settlement on the American continent")
sA[45] =  State.new("washington", "olympia", "houses Boeing’s airplane factory, the worlds largest factory by volume at nearly 500 million cubic feet")
sA[46] =  State.new("west virginia", "charleston", "is considered the southern most northern state and the northern most southern state")
sA[47] =  State.new("wisconsin", "madison", "is considered the dairy capital of the United States")
sA[48] =  State.new("wyoming", "cheyenne", "houses the bulk of Yellowstone National Park")
sA[49] =  State.new("iowa", "des moines", "has the highest literacy rate (99%) in the United States")


# gets number of players and introduces rules
def ask_player_num 
  valid_input = true
  until valid_input == false
    def player_prompt 
      puts "Are there 1 or 2 players? Please enter 1 or 2:"
      player_input = gets.chomp
    end
    response = player_prompt
    if response == "2"
      valid_input = false
      puts "Player 1 and Player 2: Welcome to the competition!!!!!!"
      puts "The first player to end a round with 10 points (or higher if there's a tie) wins!!"
      puts "Remember to spell correctly. Don't worry about capitalization"
      puts 
      puts "If you get a wildcard question, you must wager your current points on it."
      puts "If you answer it correctly, you win the number of points you wagered."
      puts "But if you answer wrong, you LOSE the number of points you wagered." 
      puts "Good luck!"
      return true
    elsif response == "1"
      valid_input = false
      puts "Let's see how quickly you can get to 10 points and win!!"
      puts "Remember to spell correctly. Don't worry about capitalization"
      return false
    else
      puts "Error: Please enter the number 1 or the number 2"
    end
  end
end

# puts each players' score (for two player) by calling on the relevant hash value
def two_player_score (i, players, total_score)
  puts "the score is now"
  players.each {|i| puts "#{i}: #{total_score[i]} point(s)"}
end

# puts player's score (for one player) by calling on the relevant hash value
def one_player_score(players_one_player, total_score)
  puts "the score is now"
  players_one_player.each {|i| puts "#{i}: #{total_score[i]}"}
end


# determines if question will be a wildcard question through use of rand
# note that, because there is no "Player 2", single player games will never have a wildcard
def select_if_wildcard (total_score)
  wildcard_random = rand
  if (wildcard_random < 0.13) && (total_score["Player 1"] >= 1) && (total_score["Player 2"] >= 1)
    true
  else
    false
  end
end

# gets user's point wager and prevents invalid input
def wildcard_prompt (i, players, total_score, wildcard_selection)
  if wildcard_selection == true
    puts ""
    puts "#{i}: You got a wildcard!"
    invalid_wildcard_entry = true
    while invalid_wildcard_entry
      puts ""
      puts "Please enter the number of points you would like to wager."
      puts "You can wager up to #{total_score[i]} point(s)!"
      wager = gets.chomp.to_i
      if wager.class != Fixnum || wager > total_score[i] 
        puts "Error: please enter a whole number of no more than #{total_score[i]}"
        puts ""
      elsif wager < 1 
        puts "Error: please enter a whole number of at least 1"
        puts ""
      else 
        puts "Okay! You have wagered #{wager} point(s)!"
        invalid_wildcard_entry = false
        return wager
      end
    end
  end
end

#chooses the quiz question and gets the user's answer 
#called using sA for state_array argument
def q_generator (i, state_array, players, q_random, state_random, state_choice)
  if q_random == 0
    puts 
    puts "#{[i]}: What is the capital of #{state_choice.upcase}?"
    answer = gets.chomp.downcase
  else
    puts 
    puts "#{[i]}: Which state #{state_array[state_random].trivia}?"
    answer = gets.chomp.downcase
  end
end

#determines the correct answer based on the question (i.e q_random argument)
#evalutes whether user answer matches correct answer
#based on answer correctness and wildcard status(always false): updates score, passes on to answer_followup method
def quiz_q_eval (i, wildcard_selection, wildcard_result, state_array, players, total_score, quiz_q, q_random, state_random)
  if q_random == 0
    state_answer = state_array[state_random].capital 
  elsif q_random == 1
    state_answer = state_array[state_random].name
  end
 if wildcard_selection == true && quiz_q.downcase == state_answer.downcase
    total_score[i] += wildcard_result
    puts "#{i}: You are correct!"
    puts "You won the wildcard challenge!!!"
    puts 
    two_player_score(i, players, total_score)
    puts 
    puts "now it's the next player's turn"
    return true
  elsif wildcard_selection == true && quiz_q.downcase != state_answer.downcase
    total_score[i] -= wildcard_result
    puts "#{i}: Darn! You got it wrong and lost the wildcard challenge!"
    puts 
    two_player_score(i, players, total_score)
    puts 
    puts "Now the other player has a chance to steal for 1 point!"
    return false
  elsif wildcard_selection == false && quiz_q.downcase == state_answer.downcase
    total_score[i] += 1 
    puts "Great job, #{i}, you got it right!!"
    puts 
    two_player_score(i, players, total_score)
    puts 
    puts "now it's the next player's turn"
    return true
  elsif quiz_q.downcase == nil || (wildcard_selection == false && quiz_q.downcase != state_answer.downcase)
    puts "#{i}: Oh no, you got it wrong!"
    puts 
    two_player_score(i, players, total_score)
    puts 
    puts "Now the other player has a chance to steal for 1 point!"
    return false
  end
end

#for one player games
#determines the correct answer based on the question (i.e q_random argument)
#evalutes whether user answer matches correct answer
#based on answer correctness and wildcard status: updates score. 
#Does not pass to answer_followup method (because no other player to follow up with)
def quiz_q_eval_one_player (i, wildcard_selection, wildcard_result, state_array, players_one_player, total_score, quiz_q, q_random, state_random)
  if q_random == 0
    state_answer = state_array[state_random].capital 
  elsif q_random == 1
    state_answer = state_array[state_random].name
  end
  if wildcard_selection == false && quiz_q.downcase == state_answer.downcase
    total_score[i] += 1 
    puts "Great job, #{i}, you got it right!!"
    puts 
    one_player_score(players_one_player, total_score)
    return true
  elsif quiz_q.downcase == nil || (wildcard_selection == false && quiz_q.downcase != state_answer.downcase)
    puts "#{i}: Oh no, you got it wrong!"
    puts 
    one_player_score(players_one_player, total_score)
    return false
  end
end

#determines the correct answer based on the question (i.e q_random argument)
#if player answered their question incorrectly, allows other player to steal their question
#updates score for successful steals
def answer_followup (i, eval_result, players, total_score, q_random, state_array, state_random)
  if q_random == 0
    state_answer = state_array[state_random].capital 
  elsif q_random == 1
    state_answer = state_array[state_random].name
  end

  if eval_result == false && i == "Player 1"
    puts "Player 2, what is the answer to Player 1's question?:"
    answer_steal = gets.chomp
    if answer_steal.downcase == state_answer
      puts 
      puts "Player 2: You got it! You stole the question for 1 point!"
      total_score["Player 2"] += 1 
      puts 
      two_player_score(i, players, total_score)
      puts
    elsif answer_steal.downcase != state_answer
      puts
      puts "Player 2: That was also incorrect! The answer is actually #{state_answer.upcase}"
      puts 
      two_player_score(i, players, total_score)
      puts
      puts "Fortunately, Player 2, it's now your turn!"
    end
  elsif eval_result == false && i == "Player 2"
    puts "Player 1, what is the answer to Player 2's question?:"
    answer_steal = gets.chomp
    if answer_steal.downcase == state_answer
      puts 
      puts "Player 1: You got it! You stole the question for 1 point!"
      total_score["Player 1"] += 1 
      puts 
      two_player_score(i, players, total_score)
      puts 
    elsif answer_steal.downcase != state_answer
      puts 
      puts "Player 1: That was also incorrect! The answer is actually #{state_answer.upcase}"
      puts 
      two_player_score(i, players, total_score)
      puts 
      puts "Fortunately, Player 1, it's now your turn!"
    end 
  end
end

# ends the while loop for the game end the end of the round if critical score is reached
# if there is a tie, keeps looping until there is a clear winner
# announces winner and ends game
def end_game (total_score, score_less_than_10)
  if (total_score["Player 1"] >= 10 || total_score["Player 2"] >= 10) 
    if (total_score["Player 1"] == total_score["Player 2"]) 
      puts "It's a tie! The first player to finish a round with a higher score wins!"
      true
    else
      if total_score["Player 1"] > total_score["Player 2"]
        puts "Wait..hold that thought. Congratulations Player 1!! You're the winner!! You really know your state trivia!"
        false
      else 
        puts "Wait..hold that thought. Congratulations Player 2!! You're the winner!! You really know your state trivia!"
        false
      end
    end
  else 
    puts "Get ready for a new round of questions!"
    true
  end
end

# ends the while loop for the game end the end of the round if critical score is reached
def end_game_one_player (total_score, score_less_than_10)
  if (total_score["Player 1"] >= 10)
  puts "Wait..hold that thought. Congratulations Player 1!! You're the winner!! You really know your state trivia!"
  false
  else
    true
  end
end

#all the other methods are grouped here. 
#the number of players determines which while loop is run
def runner (state_array)
  # defining my public variables and hashes
  total_score = Hash["Player 1" => 0, "Player 2" => 0]
  players = total_score.keys #["Player1", "Player2"] 
  total_score_one_player = Hash["Player 1" => 0]
  players_one_player = total_score_one_player.keys

  #beginning while loops
  score_less_than_10 = true
  num_result = ask_player_num
  while score_less_than_10 && num_result
    players.collect do |i|
      q_random = rand(2)
      state_random = rand(50)
      state_choice = state_array[state_random].name
      wildcard_selection = select_if_wildcard (total_score)
      wildcard_result = wildcard_prompt(i, players, total_score, wildcard_selection)
      quiz_q = q_generator(i, state_array, players, q_random, state_random, state_choice)
      eval_result = quiz_q_eval(i, wildcard_selection, wildcard_result, state_array, players, total_score, quiz_q, q_random, state_random)
      answer_followup(i, eval_result, players, total_score, q_random, state_array, state_random)
    end
    score_less_than_10 = end_game(total_score, score_less_than_10)
  end
  while score_less_than_10 && num_result == false
    players_one_player.collect do |i|
      q_random = rand(2)
      state_random = rand(50)
      state_choice = state_array[state_random].name
      wildcard_selection = select_if_wildcard (total_score)
      wildcard_result = wildcard_prompt(i, players, total_score, wildcard_selection)
      quiz_q = q_generator(i, state_array, players, q_random, state_random, state_choice)
      eval_result = quiz_q_eval_one_player(i, wildcard_selection, wildcard_result, state_array, players_one_player, total_score, quiz_q, q_random, state_random)
    end
    score_less_than_10 = end_game_one_player(total_score, score_less_than_10)
  end
end

#runs the code. Passes in the state array objects
runner(sA)

