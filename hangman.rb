
require "rspec"
require "colorize"
require "tty-prompt"
require "json"


## todo
# -tests
# -load and save game

@prompt = TTY::Prompt.new

puts '                       ___________.._______         '
puts '                      | .__________))______|        '
puts '                      | | / /      ||               '
puts '                      | |/ /       ||               '
puts '                      | | /        ||.- -.          '
puts '                      | |/         |/  _  \         '
puts '                      | |          ||  `/,          '
puts '                      | |          (\`_.            '
puts '                      | |         .-`---`.          '
puts '                      | |        /Y . . Y \          '
puts '                      | |      / / |   | \ \        '
puts '                      | |     / /  | . |  \ \        '
puts '                      | |    (`)   |   |   `(`       '
puts '                      | |          || ||            '
puts '                      | |          || ||            '
puts '                      | |          || ||            '
puts '                      | |          || ||            '
puts '                      | |         / | | \           '
puts '                      |``````````|_`-`` `-`` |```|  '
puts '                      |`|```````\ \ ````````  |`|   '
puts '                      | |        \ \          | |   '
puts '                      : :         \ \         : :   '
puts '                      . .          `          . .   '

@logo = 
puts "|--------------------------------------------------------------------------------------------------------------|   "
puts "|  ooooo   ooooo       .o.       ooooo      ooo   .oooooo.    ooo        ooooo       .o.       ooooo      ooo  |   "
puts "|  `888    `888       .888.      `888b.     `8   d8P   `Y8b   `88.       .888'      .888.      `888b.     `8   |   "
puts "|   888     888      .88888.      8 `88b.    8  888            888b     d'888      .88888.      8 `88b.    8   |   "
puts "|   888ooooo888     .8' `888.     8   `88b.  8  888            8 Y88. .P  888     .8' `888.     8   `88b.  8   |   "  
puts "|   888     888    .88ooo8888.    8     `88b.8  888     ooooo  8  `888'   888    .88ooo8888.    8     `88b.8   |   "  
puts "|   888     888   .8'     `888.   8       `888  `88.    .88'   8    Y     888   .8'     `888.   8       `888   |   "
puts "|  o888o   o888o o88o     o8888o o8o        `8   `Y8bood8P'   o8o        o888o o88o     o8888o o8o        `8   |   "
puts "|--------------------------------------------------------------------------------------------------------------|   "    
puts " "
puts " "
puts " "

@logo                                                                 
                                                                            
def clear_screen
    system("clear")
    @logo
end                                                                            



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
            winner = false
            puts @display_word
            puts "Enter guess"
            guess = gets.chomp
            update_display(guess) if guess
            winner = winner?
            break if guess == "exit"
            break if winner
        end 
    end

    def winner?
        @prompt = TTY::Prompt.new
        unless @display_word.include?("-")
            puts "You won!"
            puts " "
            @prompt.select("Would you like to play again?", %w(Play Exit))
            if %w(Play)
                main_menu
            else
                exit
            end
            true
        end        
    end

    def update_display(guess)
        guess.downcase!
        @used_letters << guess
        display_update = "#{@display_word}"
        if guess.length == 1
            @display_word.length.times do |index|
                @display_word[index] = guess if @word[index].downcase == guess
            end
        else
            @display_word = guess if guess == @word.downcase
        end
        
        if display_update == @display_word
            system("clear")
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
            puts"    ________   "
            puts"   |/      |   "
            puts"   |           "
            puts'   |           '
            puts"   |           "
            puts'   |           '
            puts"   |           "
            puts"___|___        "
            puts " "
            puts "5 attempts remaining"
            puts " "
            puts "Letters Used: #{@used_letters}"
        when 2
            @clear_screen
            puts"    ________   "
            puts"   |/      |   "
            puts"   |      (_)  "
            puts'   |           '
            puts"   |           "
            puts'   |           '
            puts"   |           "
            puts"___|___        "
            puts " "
            puts "4 attempts remaining"
            puts " "
            puts "Letters Used: #{@used_letters}"
        when 3
            @clear_screen
            puts"    ________   "
            puts"   |/      |   "
            puts"   |      (_)  "
            puts'   |      \|/  '
            puts"   |           "
            puts'   |           '
            puts"   |           "
            puts"___|___        "
            puts " "
            puts "3 attempts remaining"
            puts " "
            puts "Letters Used: #{@used_letters}"
        when 4
            @clear_screen
            puts"    ________   "
            puts"   |/      |   "
            puts"   |      (_)  "
            puts'   |      \|/  '
            puts"   |       |   "
            puts'   |           '
            puts"   |           "
            puts"___|___        "
            puts " "
            puts "2 attempts remaining"
            puts " "
            puts "Letters Used: #{@used_letters}"
        when 5
            @clear_screen
            puts"    ________   "
            puts"   |/      |   "
            puts"   |      (_)  "
            puts'   |      \|/  '
            puts"   |       |   "
            puts'   |      /    '
            puts"   |           "
            puts"___|___        "
            puts " "
            puts "1 attempts remaining"
            puts " "
            puts "Letters Used: #{@used_letters}"
        when 6
            @clear_screen
            puts"    ________   "
            puts"   |/      |   "
            puts"   |      (_)  "
            puts'   |      \|/  '
            puts"   |       |   "
            puts'   |      / \  '
            puts"   |           "
            puts"___|___        "
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
clear_screen

  

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
    new_game = Game.new(@words)
    new_game.begin  
end

def main_menu

    @prompt.select("Menu", %w(NewGame LoadGame Exit))

    if %w(NewGame)
        theme_select
    elsif %w(LoadGame)
        if File.exist?("savedgame.json")
            Game.load_game  
        end
    else
        exit
    end
        
end  

main_menu

clear_screen

