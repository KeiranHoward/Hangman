require_relative "./animals"
File.open("animals.rb", "r") do |fileanimals|


class Hangman 
    def initialize    
        @hiddenword = hiddenword
        @attempts == 0
        @theme = theme_select
    end


    def theme 
     puts "Please select a word theme"
     puts "(a) Animals"
     puts "(b) Geography"
     puts "(c) School"
     puts "(d) Jobs"
     puts "(e) Computers"   
     theme_select = gets.chomp.downcase
    end

    def load_themes
        animals = fileanimals.sample.upcase.strip 
        geography = filegeography.sample.upcase.strip 
        school = fileschool.sample.upcase.strip 
        jobs = filejobs.sample.upcase.strip 
        computers = filecomputers.sample.upcase.strip 
    end
    def word_list(theme_select)
        case 
        when theme_select == "a"
            puts "animals"
        when theme_select == "b"

        when theme_select == "c"
        
        when theme_select == "d"

        when theme_select == "e"
        end
    end
end
    # def hiddenword 
        
    # end

    # def attempts
        
    # end

    # def wincheck
    # end

    # def load_game

    # end

    # def save_game
        
    # end















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