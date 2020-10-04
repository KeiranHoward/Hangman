
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

describe 'correct_guess' do
  it 'gets user input and verifies it against a hidden word' do
    hidden_word = "bird"
    user_guess = "b"
    is_true = false
    if hidden_word.include? user_guess
      is_true = true
    end
    expect(is_true).to eq(true)
  end


end