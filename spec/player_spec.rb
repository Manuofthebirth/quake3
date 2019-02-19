require "player"
require "log_parser"

describe Player do

    before :each do
      @log_lines = LogParser.read_file('one_game.log')
      @game = Player.new @log_lines
    end

  describe "#id" do
    it "should return the player id" do
      player = Player.new(id: 3)
      expect(player.id).to eq(3)
    end
  end

  describe "#name" do
    it "should return the name of the player" do
      player = Player.new(name: "Isgalamido")
      expect(player.name).to eq("Isgalamido")
    end
  end

  describe "#score" do
    it "should return the score of the player" do
      player = Player.new(score: 19)
      expect(player.score).to eq(19)
    end
  end
end