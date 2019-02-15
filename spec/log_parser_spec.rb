require 'log_parser'

describe LogParser do
  before :each do
    @log_lines = LogParser.read_file('spec/test_logs/one_game.log')
  end

  describe '.read_file' do
    it 'can open a log file' do
      expect(@log_lines).to be_a Array
      it { @log_lines.should_not be_empty }
    end
  end
end
