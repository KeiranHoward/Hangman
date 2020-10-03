
require "rspec"
require "colorize"
require "tty-prompt"
require "json"


## todo
# -make logo
# -make intro class
# -play again feature
# -tests
# -load and save game

@prompt = TTY::Prompt.new
@logo = "TEST"



class Game
    attr_accessor :word, :load_game, :menu, :begin
    def initialize(word)
        
        @attempts = 0
        @word = word
        @display_word = "-" * @word.length
        @used_letters = []
    end

    def begin
        while @attempts < 6
            puts @display_word
            puts "Enter guess"
            guess = gets.chomp
            update_display(guess) if guess
            #add win break
        end 
    end

    def winner?

        unless @display_word.include?("_ ")
            puts "You won!"
            puts "Would you like to play again?"
            # @prompt.select("Would you like to play again?", %w(Play Exit))
            # if @prompt == %(Play)
            #     Menu.main_menu
            # else
            #     exit
            # end
        end        
    end

    def update_display(guess)
        guess.downcase!
        @used_letters << guess
        current_state = "#{@display_word}"
        if guess.length == 1
            @display_word.length.times do |index|
                @display_word[index] = guess if @word[index].downcase == guess
            end
        else
            @display_word = guess if guess == @word.downcase
        end
        
        if current_state == @display_word
            hangman(1)
        else
            hangman(0)
        end
    end

    def hangman(increment)
        @attempts += increment
        
        case @attempts

        when 0
            puts " "
        when 1
            
            puts     "    --------   "
            puts     "    |      |   "
            puts     "    |      o   "
            puts     "    |          "
            puts     "    |          "
            puts     "  -----------  " 
            puts " "
            puts "5 attempts remaining"
            puts " "
            puts "Letters Used: #{@used_letters}"
        when 2
            system("clear")
            puts     "    --------   "
            puts     "    |      |   "
            puts     "    |      o   "
            puts     "    |      |   "
            puts     "    |          "
            puts     "  -----------  " 
            puts " "
            puts "4 attempts remaining"
            puts " "
            puts "Letters Used: #{@used_letters}"
        when 3
            system("clear")
            puts     "    --------   "
            puts     "    |      |   "
            puts     "    |      o   "
            puts     "    |     /|   "
            puts     "    |          "
            puts     "  -----------  " 
            puts " "
            puts "3 attempts remaining"
            puts " "
            puts "Letters Used: #{@used_letters}"
        when 4
            system("clear")
            puts     "    --------   "
            puts     "    |      |   "
            puts     "    |      o   "
            puts     "    |     /|/  "
            puts     "    |          "
            puts     "  -----------  " 
            puts " "
            puts "2 attempts remaining"
            puts " "
            puts "Letters Used: #{@used_letters}"
        when 5
            system("clear")
            puts     "    --------   "
            puts     "    |      |   "
            puts     "    |      o   "
            puts     "    |     /|/  "
            puts     "    |     /    "
            puts     "  -----------  " 
            puts " "
            puts "1 attempts remaining"
            puts " "
            puts "Letters Used: #{@used_letters}"
        when 6
            system("clear")
            puts     "    ---------   "
            puts     "    |       |   "
            puts     "    |       o   "
            puts     "    |      /|/  "
            puts     "    |      /|  "
            puts     "  -----------  " 
            puts "You Lose"
            puts " "
            puts "Your word was #{@word}"
        end    
    end
    
end



def intro
    puts "Welcome to Hangman".colorize(:light_blue)
    puts "Enter your name below".colorize(:light_blue)
    username = gets.chomp
end

intro
system("clear")

def main_menu

    @prompt.select("Menu", %w(NewGame LoadGame Exit))

    if %w(NewGame)
        puts "Loading"
    elsif %w(LoadGame)
        if File.exist?("savedgame.json")
            Game.load_game  
        end
    else
        exit
    end
        
end    

main_menu
system("clear")

def theme_select 

    @prompt = TTY::Prompt.new
    @prompt.select("Please select a theme", %w(Animals Countries Careers Computers))
        
    case 
    when %w(Animals)
        wordlist = File.readlines("animals.txt")
        @words = wordlist.sample.strip
    when %w(Countries)
        wordlist = File.readlines("countries.txt")
        @words = wordlist.sample.strip
    when %w(Careers)
        wordlist = File.readlines("careers.txt")
        @words = wordlist.sample.strip
    when %w(Computers)
        wordlist = File.readlines("computers.txt")
        @words = wordlist.sample.strip
    end
end

theme_select

system("clear")

new_game = Game.new(@words)
new_game.begin