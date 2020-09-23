require_relative "word-list"

puts "Welcome to Hangman!"

puts wordlist

class Hangman

    def initialize
        @word = wordlist
        @worddisplay = "_" * @word.length
        @attemps = 0
        @gameover = false
    end

    puts @word
   
end

case 
when attemps == 0 
    puts 
    "    --------   "
    "    |      |   "
    "    |          "
    "    |          "
    "    |          "
    "  -----------  "  

when attemps == 1 puts 
    "    --------   "
    "    |      |   "
    "    |      O   "
    "    |          "
    "    |          "
    "  -----------  "  

when attemps == 2 puts 
letterused + 
    "    --------   "
    "    |      |   "
    "    |      O   "
    "    |      |   "
    "    |          "
    "  -----------  "

when attemps == 3 puts

    "    --------   "
    "    |      |   "
    "    |      O   "
    "    |     /|   "
    "    |          "
    "  -----------  "    

when attemps == 4 puts

    "    --------   "
    "    |      |   "
    "    |      O   "
    "    |     /|\  "
    "    |          "
    "  -----------  "  

when attemps == 5 puts

    "    --------   "
    "    |      |   "
    "    |      O   "
    "    |     /|\  "
    "    |     /    "
    "  -----------  "      

when attemps == 6 puts

    "    --------   "
    "    |      |   "
    "    |      O   "
    "    |     /|\  "
    "    |     / \  "
    "  -----------  "  + "Game over! the word was #{randomword}"      