
require "rspec"
require "colorize"
require "rspec"
require "tty-prompt"

@prompt = TTY::Prompt.new
@logo = "TEST"

class Game
    attr_accessor :word, :display_word

    def initialize (word, display_word)
        @alphabet = ("a".."z").to_a
        @word = word
        @attempts = 6
        @display_word = display_word
    end

    def update_screen
        system("clear")
        puts @logo
    end

    def user_guess

        if attempts > 0
            puts "Enter a letter"
            guess = gets.chomp
        end    
        good_guess = @word.include? guess

        if good_guess == true
            
            
        
        

    end        
end  





####
## end of class

## game intro

def intro
    puts "Welcome to Hangman".colorize(:light_blue)
    puts "Enter your name below".colorize(:light_blue)
    username = gets.chomp
end

intro
system("clear")

##theme select

@prompt.select("Newgame", %w(NewGame LoadGame Exit))
if %w(NewGame)
    puts " "

elsif %w(LoadGame)
    puts "not yet"    
else
    puts "not yet"
end


def theme
    @prompt = TTY::Prompt.new
    @prompt.select("Please select a theme", %w(Animals Geography Careers Computers))
    wordlist = nil
    @word_select = nil
    case 
    when %w(Animals)
        wordlist = File.open("animals.txt")
        @word_select = wordlist.to_a
    when %w(Geography)
        wordlist = File.open("geography.txt")
        @word_select = wordlist.to_a
    when %w(Careers)
        wordlist = File.open("careers.txt")
        @word_select = wordlist.to_a
    when %w(Computers)
        wordlist = File.open("computers.txt")
        @word_select = wordlist.to_a
    end
end

theme

system("clear")
#loading bar

## pick word and split

def word
    word = @word_select.map {|word| word.upcase.strip}
    secretword = word.sample
    split_word = secretword.chars()
    display_word = secretword
end


def display_word
    puts "_ " * word.length
end


start_game = Game.new(word, display_word)

start_game