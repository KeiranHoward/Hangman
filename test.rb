
@correct = []
@attempts = 6
@word = "COW"
@wrong = []


def is_correct?(guess)
    user_guess = user_guess.to_s.chr.upcase
    if @word.upcase.include? user_guess
      if not @correct.include? user_guess
        @correct << user_guess
        puts @correct
      end
      true
    else
      if not @wrong.include? user_guess
        @wrong << user_guess
        @attempts += -1
      end
      false
    end
end


puts "please enter a guess"
guess = gets.chomp.upcase

is_correct?(guess)



# case 
# when attemps == 0 
#     puts 
#     "    --------   "
#     "    |      |   "
#     "    |          "
#     "    |          "
#     "    |          "
#     "  -----------  "  

# when attemps == 1 puts 
#     "    --------   "
#     "    |      |   "
#     "    |      O   "
#     "    |          "
#     "    |          "
#     "  -----------  "  

# when attemps == 2 puts 
# letterused + 
#     "    --------   "
#     "    |      |   "
#     "    |      O   "
#     "    |      |   "
#     "    |          "
#     "  -----------  "

# when attemps == 3 puts

#     "    --------   "
#     "    |      |   "
#     "    |      O   "
#     "    |     /|   "
#     "    |          "
#     "  -----------  "    

# when attemps == 4 puts

#     "    --------   "
#     "    |      |   "
#     "    |      O   "
#     "    |     /|\  "
#     "    |          "
#     "  -----------  "  

# when attemps == 5 puts

#     "    --------   "
#     "    |      |   "
#     "    |      O   "
#     "    |     /|\  "
#     "    |     /    "
#     "  -----------  "      

# when attemps == 6 puts

#     "    --------   "
#     "    |      |   "
#     "    |      O   "
#     "    |     /|\  "
#     "    |     / \  "
#     "  -----------  "  + "Game over! the word was #{randomword}"      