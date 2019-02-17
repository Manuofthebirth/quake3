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