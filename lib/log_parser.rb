require "rspec/autorun"

class LogParser
  def self.read_file(file = 'qgames.log')
    lines_array = []
    file = File.open(file, 'r')
    file.each_line { |line| lines_array << line }

    lines_array
  end

  def self.parse_log(file = 'qgames.log')
    log_lines = LogParser.read_file('qgames.log')
  end
end


describe LogParser do
  before :each do
	  @log_lines = LogParser.read_file('qgames.log')
  end

  describe '.read_file' do
    it 'should return an Array' do
		expect(@log_lines).to be_a Array
    end
  end

  describe '.parse_log' do
  	it 'can open a log file' do
  		expect(@log_lines).not_to be_empty
  	end
  end
end