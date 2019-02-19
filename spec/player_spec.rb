require "player"
require "log_parser"

describe Game do

    before :each do
      @log_lines = LogParser.read_file('one_game.log')
      @game = Player.new @log_lines
    end

end