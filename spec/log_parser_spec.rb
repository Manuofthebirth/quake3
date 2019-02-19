require "log_parser"

describe LogParser do
  
  before :each do
	  @log_lines = LogParser.read_file('one_game.log')
  end

  describe '.read_file' do
    it 'can open a log file' do
      expect(@log_lines).not_to be_empty
    end
  end


  describe '.parse_log' do
    it 'should return an Array of lines' do
      expect(@log_lines).to be_a Array
    end
  end

end