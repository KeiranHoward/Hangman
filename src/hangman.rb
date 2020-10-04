
require "rspec"
require "colorize"
require "tty-prompt"
require "json"
require "jbuilder"
require "powerpack"


## todo
# -tests
# -load and save game

@prompt = TTY::Prompt.new

puts '                       ___________.._______         '.colorize(:color => :light_blue, :background => :grey)
puts '                      | .__________))______|        '.colorize(:color => :light_blue, :background => :grey)
puts '                      | | / /      ||               '.colorize(:color => :light_blue, :background => :grey)
puts '                      | |/ /       ||               '.colorize(:color => :light_blue, :background => :grey)
puts '                      | | /        ||.- -.          '.colorize(:color => :light_blue, :background => :grey)
puts '                      | |/         |/  _  \         '.colorize(:color => :light_blue, :background => :grey)
puts '                      | |          ||  `/,          '.colorize(:color => :light_blue, :background => :grey)
puts '                      | |          (\`_.            '.colorize(:color => :light_blue, :background => :grey)
puts '                      | |         .-`---`.          '.colorize(:color => :light_blue, :background => :grey)
puts '                      | |        /Y . . Y \         '.colorize(:color => :light_blue, :background => :grey)
puts '                      | |      / / |   | \ \        '.colorize(:color => :light_blue, :background => :grey)
puts '                      | |     / /  | . |  \ \       '.colorize(:color => :light_blue, :background => :grey)
puts '                      | |    (`)   |   |   `(`      '.colorize(:color => :light_blue, :background => :grey)
puts '                      | |          || ||            '.colorize(:color => :light_blue, :background => :grey)
puts '                      | |          || ||            '.colorize(:color => :light_blue, :background => :grey)
puts '                      | |          || ||            '.colorize(:color => :light_blue, :background => :grey)
puts '                      | |          || ||            '.colorize(:color => :light_blue, :background => :grey)
puts '                      | |         / | | \           '.colorize(:color => :light_blue, :background => :grey)
puts '                      |``````````|_`-`` `-`` |```|  '.colorize(:color => :light_blue, :background => :grey)
puts '                      |`|```````\ \ ````````  |`|   '.colorize(:color => :light_blue, :background => :grey)
puts '                      | |        \ \          | |   '.colorize(:color => :light_blue, :background => :grey)
puts '                      : :         \ \         : :   '.colorize(:color => :light_blue, :background => :grey)
puts '                      . .          `          . .   '.colorize(:color => :light_blue, :background => :grey)

@logo = 
puts "|--------------------------------------------------------------------------------------------------------------|   ".colorize(:color => :light_blue, :background => :grey)
puts "|  ooooo   ooooo       .o.       ooooo      ooo   .oooooo.    ooo        ooooo       .o.       ooooo      ooo  |   ".colorize(:color => :light_blue, :background => :grey)
puts "|  `888    `888       .888.      `888b.     `8   d8P   `Y8b   `88.       .888'      .888.      `888b.     `8   |   ".colorize(:color => :light_blue, :background => :grey)
puts "|   888     888      .88888.      8 `88b.    8  888            888b     d'888      .88888.      8 `88b.    8   |   ".colorize(:color => :light_blue, :background => :grey)
puts "|   888ooooo888     .8' `888.     8   `88b.  8  888            8 Y88. .P  888     .8' `888.     8   `88b.  8   |   ".colorize(:color => :light_blue, :background => :grey)  
puts "|   888     888    .88ooo8888.    8     `88b.8  888     ooooo  8  `888'   888    .88ooo8888.    8     `88b.8   |   ".colorize(:color => :light_blue, :background => :grey)  
puts "|   888     888   .8'     `888.   8       `888  `88.    .88'   8    Y     888   .8'     `888.   8       `888   |   ".colorize(:color => :light_blue, :background => :grey)
puts "|  o888o   o888o o88o     o8888o o8o        `8   `Y8bood8P'   o8o        o888o o88o     o8888o o8o        `8   |   ".colorize(:color => :light_blue, :background => :grey)
puts "|--------------------------------------------------------------------------------------------------------------|   ".colorize(:color => :light_blue, :background => :grey)    
puts " "
puts " "


@logo                                                                 
                                                                            
def clear_screen
    return system("clear")
    return @logo
end                                                                            



class Game
    attr_accessor :word, :load_game, :menu, :begin
    def initialize(word)
        
        @attempts = 0
        @word = word
        @display_word = "-" * @word.length
        @used_letters = []
        @prompt = TTY::Prompt.new
    end

    def begin
        while @attempts < 6
            winner = false
            puts " "
            puts @display_word
            puts " "
            puts "Enter guess"
            guess = gets.chomp
            update_display(guess) if guess
            winner = winner?
            loser = loser?
            break if guess == "exit"
            break if winner
            break if loser
        end 
    end

    def loser?
        if @attempts == 6
            "You lost"
            play_again = @prompt.select("Would you like to play again?", ["Play", "Exit"])
            unless play_again == "Play"
                exit
            else
                main_menu
            end
            true
        end  
    end

    def winner?
        @prompt = TTY::Prompt.new
        unless @display_word.include?("-")
            puts "You won!"
            puts " "
            play_again = @prompt.select("Would you like to play again?", ["Play", "Exit"])
            unless play_again == "Play"
                exit
            else
                main_menu
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
            clear_screen
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
            puts"    ________   ".colorize(:light_blue)
            puts"   |/      |   ".colorize(:light_blue)
            puts"   |           ".colorize(:light_blue)
            puts'   |           '.colorize(:light_blue)
            puts"   |           ".colorize(:light_blue)
            puts'   |           '.colorize(:light_blue)
            puts"   |           ".colorize(:light_blue)
            puts"___|___        ".colorize(:light_blue)
            puts " "
            puts "5 attempts remaining"
            puts " "
            puts "Letters Used: #{@used_letters}"
        when 2
            clear_screen
            puts"    ________   ".colorize(:light_blue)
            puts"   |/      |   ".colorize(:light_blue)
            puts"   |      (_)  ".colorize(:light_blue)
            puts'   |           '.colorize(:light_blue)
            puts"   |           ".colorize(:light_blue)
            puts'   |           '.colorize(:light_blue)
            puts"   |           ".colorize(:light_blue)
            puts"___|___        ".colorize(:light_blue)
            puts " "
            puts "4 attempts remaining"
            puts " "
            puts "Letters Used: #{@used_letters}"
        when 3
            clear_screen
            puts"    ________   ".colorize(:light_blue)
            puts"   |/      |   ".colorize(:light_blue)
            puts"   |      (_)  ".colorize(:light_blue)
            puts'   |      \|/  '.colorize(:light_blue)
            puts"   |           ".colorize(:light_blue)
            puts'   |           '.colorize(:light_blue)
            puts"   |           ".colorize(:light_blue)
            puts"___|___        ".colorize(:light_blue)
            puts " "
            puts "3 attempts remaining"
            puts " "
            puts "Letters Used: #{@used_letters}"
        when 4
            clear_screen
            puts"    ________   ".colorize(:light_blue)
            puts"   |/      |   ".colorize(:light_blue)
            puts"   |      (_)  ".colorize(:light_blue)
            puts'   |      \|/  '.colorize(:light_blue)
            puts"   |       |   ".colorize(:light_blue)
            puts'   |           '.colorize(:light_blue)
            puts"   |           ".colorize(:light_blue)
            puts"___|___        ".colorize(:light_blue)
            puts " "
            puts "2 attempts remaining"
            puts " "
            puts "Letters Used: #{@used_letters}"
        when 5
            clear_screen
            puts"    ________   ".colorize(:light_blue)
            puts"   |/      |   ".colorize(:light_blue)
            puts"   |      (_)  ".colorize(:light_blue)
            puts'   |      \|/  '.colorize(:light_blue)
            puts"   |       |   ".colorize(:light_blue)
            puts'   |      /    '.colorize(:light_blue)
            puts"   |           ".colorize(:light_blue)
            puts"___|___        ".colorize(:light_blue)
            puts " "
            puts "1 attempts remaining"
            puts " "
            puts "Letters Used: #{@used_letters}"
        when 6
            clear_screen
            puts"    ________   ".colorize(:light_blue)
            puts"   |/      |   ".colorize(:light_blue)
            puts"   |      (_)  ".colorize(:light_blue)
            puts'   |      \|/  '.colorize(:light_blue)
            puts"   |       |   ".colorize(:light_blue)
            puts'   |      / \  '.colorize(:light_blue)
            puts"   |           ".colorize(:light_blue)
            puts"___|___        ".colorize(:light_blue)
            puts "You Lose".colorize(:grey)
            puts " "
            puts "Your word was #{@word}"
        end    
    end
    
end



def intro
    puts "Welcome to Hangman!".colorize(:aqua)
    puts " "
    puts "Game Rules: Type in a letter".colorize(:aqua)
    puts "for each incorrect guess, part of a hangman will be added".colorize(:aqua)
    puts "guess the correct word before the hangman is complete".colorize(:aqua)
    puts "you can exit at anytime by typing in exit".colorize(:aqua)
    puts " "
    puts "Press any key to continue...".colorize(:aqua)
    enter = gets.chomp
end

intro
clear_screen

  

def theme_select 

    @prompt = TTY::Prompt.new
    choose_theme = @prompt.select("Please select a theme", ["Animals", "Countries", "Careers", "Computers"])
    case choose_theme
    when "Animals"
        wordlist = File.readlines("wordlists/animals.txt")
        @words = wordlist.sample.strip
    when "Countries"
        wordlist = File.readlines("wordlists/countries.txt")
        @words = wordlist.sample.strip
    when "Careers"
        wordlist = File.readlines("wordlists/careers.txt")
        @words = wordlist.sample.strip
    when "Computers"
        wordlist = File.readlines("wordlists/computers.txt")
        @words = wordlist.sample.strip
    end
    new_game = Game.new(@words)
    new_game.begin  
end

def main_menu

    menu_select = @prompt.select("Menu", ["NewGame", "LoadGame", "Exit"])

    if menu_select == "NewGame"
        theme_select
    elsif menu_select == "LoadGame"
        if File.exist?("savedgame.json")
            Game.load_game  
        end
    else
        exit
    end
        
end  

main_menu

clear_screen

