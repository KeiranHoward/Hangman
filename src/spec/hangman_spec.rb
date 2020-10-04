
require 'rspec'

# theme select method test

describe 'theme_select' do
    describe '#theme_select' do
        it 'opens a file and pulls a word' do
          wordlist = File.readlines("test.txt")
          word = wordlist.sample.strip
          expect(word).to eq("bird")
        end
    end
end

# Check if guess is correct


end