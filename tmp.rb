require "tty-prompt"
@prompt = TTY::Prompt.new

def menu
    @prompt.select("Choose your destiny?", %w(Scorpion Kano Jax))
end

menu