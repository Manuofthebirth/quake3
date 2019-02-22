require 'spec_helper'
require_relative '../lib/log_parser'
require_relative '../lib/game'
require 'pry-byebug'


describe LogParser do
  subject(:log) { LogParser.new(File.open('test/test.txt').read) } # for repeated test lines

  it 'should initialize with a log' do
    expect { log }.not_to raise_error
  end

  describe '#raw_log' do
    it 'returns the raw log text' do
      log_string = File.open('test/test.txt').read
      expect(log.raw_log).to eq(log_string)
    end
  end

  describe '#game_logs' do
    it 'returns separate game logs correctly' do
      game1_string = File.open('test/game_test1.txt').read
      game2_string = File.open('test/game_test2.txt').read
      expect(log.game_logs[0]).to eq(game1_string)
      expect(log.game_logs[1]).to eq(game2_string)
    end
  end

  describe '#games' do
    it 'returns an array of games' do
      expect(log.games[0]).to be_a(Game)
    end
  end
end
