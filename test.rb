
wordlist = File.open("animals.txt")
wordlist = wordlist.to_a
word = wordlist.map {|word| word.upcase.strip}
secretword = word.sample

def hideword(word)
    puts ("_") * word.length
end

hideword(secretword)
attempts = 0


def guess (word)
    userguess = gets.chomp.upcase
    if word.include? userguess 
        puts userguess    
    else 
        puts "no"
    end     
end

guess(secretword)