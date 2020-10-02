
require "rspec"
require "colorize"
require "rspec"
require "tty-prompt"

@prompt = TTY::Prompt.new
@logo = "TEST"


class Menu

    def initialize
        @start = start
        @prompt = TTY::Prompt.new
    end
    
    def start
        @prompt = TTY::Prompt.new
        @prompt.select("Use ↑/↓ arrow keys to select, then hit Enter", %w(NewGame LoadGame))

    end
end