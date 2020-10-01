require_relative 'animals'
require_relative 'careers'
require_relative 'geography'
require_relative 'computers'
require "rspec"
require "colorize"
require "rspec"
require "tty-prompt"

prompt = TTY::Prompt.new
@logo = ""

class Game

    def initialize
        @alphabet = ("a".."z").to_a
        @theme = theme
        @word = words.sample
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
        puts "/n"
    end

    def menu
        choices = %w(NewGame LoadGame)
        prompt.multi_select("Use ↑/↓ arrow keys to select, then hit Enter", choices)
    end

    def load_game    