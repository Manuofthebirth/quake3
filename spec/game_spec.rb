require "game"
require "log_parser"

  describe Game do
    before :each do
      @log_lines = LogParser.read_file('one_game.log')
      @game = Game.new @log_lines
    end

    describe '#new' do
      it 'should have a start time' do
      	expect Rules.start_game_rule === '(@log_lines(0))'
	    end

  	  it 'should have an end time' do
        	expect Rules.end_game_rule === '(@log_lines(514))'
  	  end
    end
  end