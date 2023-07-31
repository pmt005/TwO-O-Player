require_relative "player"
require_relative "question"

@game_start = true
@turn = 0

puts "Let's begin playing the TwO-O-Player Math Game!"

# Create Players

puts "Enter Name of Player 1: "
@name = gets.chomp
player_1 = Player.new(@name)
puts "Enter Name of Player 2: "
@name = gets.chomp
player_2 = Player.new(@name)

#Begin Game

while @game_start
  question = Question.new

  case @turn
  when 0
    puts "----- NEW TURN -----"
    puts "#{player_2.name}: " + question.question_string
    @answer = gets.chomp.to_i
  else
    puts "----- NEW TURN -----"
    puts "#{player_1.name}: " + question.question_string
    @answer = gets.chomp.to_i
  end

  if @turn == 0 && question.correct?(@answer)
    puts "#{player_2.name}: YES! You are correct."
    @turn += 1
  elsif @turn == 0 && !question.correct?(@answer)
    puts "#{player_2.name}: Seriously? No!"
    player_2.lose_life
    @turn += 1
  elsif @turn == 1 && question.correct?(@answer)
    puts "#{player_1.name}: YES! You are correct."
    @turn -= 1
  elsif @turn == 1 && !question.correct?(@answer)
    puts "#{player_1.name}: Seriously? No!"
    player_1.lose_life
    @turn -= 1
  end

  puts
  puts "#{player_1.name}: #{player_1.lives}/3 vs #{player_2.name}: #{player_2.lives}/3"
  puts

  if player_1.lives == 0 || player_2.lives == 0
    if player_1.lives == 0
      puts "#{player_2.name} wins with a score of #{player_2.lives}/3"
    elsif player_2.lives == 0
      puts "#{player_1.name} wins with a score of #{player_1.lives}/3"
    end
    puts
    puts "----- GAME OVER -----"
    puts "Good bye!"
    @game_start = false
  end

end