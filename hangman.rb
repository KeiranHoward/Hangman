
require "rspec"
require "colorize"
require "rspec"
require "tty-prompt"

@prompt = TTY::Prompt.new
@logo = "TEST"

class Game

    def initialize
        @alphabet = ("a".."z").to_a
        @theme = theme
        @word = word
        @attempts = 6
    end

    def update_screen
        system("clear")
        puts @logo
    end

    def intro
        puts "Welcome to Hangman".colorize(:light_blue)
        puts "Enter your name below".colorize(:light_blue)
        username = gets.chomp
    end
    

    def theme
        @prompt = TTY::Prompt.new
        @prompt.select("Please select a theme", %w(Animals Geography Careers Computers))
        case theme_select
        when %w(Animals)
            File.open("animals.txt")
        when %w(Geography)
            File.open("geography.txt")
        when %w(Careers)
            File.open("careers.txt")
        when %w(Computers)
            File.open("computers.txt")
        end
    end

    def word
    
    end


end    


@prompt = TTY::Prompt.new
@prompt.select("Please select a theme", %w(NewGame LoadGame Exit))
if %w(NewGame)
    Game.new
else
    puts "not yet"
end

def load_game
    
end

def save_game

end