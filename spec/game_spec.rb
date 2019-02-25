require 'spec_helper'
require_relative '../lib/log_parser'
require_relative '../lib/game'

describe Game do
	let(:game) { Game.new(players: ["Dono da Bola", "Mocinha", "Isgalamido", "Zeh"], total_kills: 2, means_of_death: {["MOD_TRIGGER_HURT"]=>10, ["MOD_SHOTGUN"]=>5}) }

  describe '#initialize' do
    it 'should create a new game instance' do
      expect(game).to be_an(Game)
    end

    it 'return the total of kills in a game' do
      expect(game.total_kills).to eq(2)
    end

	end

	describe "#players_info" do
    it 'return the name of the players in a game' do
    	game_string = File.open('test/game_test2.txt').read
      expect(game_string.players_info).to eq(["Dono da Bola", "Mocinha", "Isgalamido", "Zeh"])
    end
	end

 	describe "#killer_infos" do
	  it 'return the killer and victim of a kill event' do
	  	log_text = "21:42 Kill: 1022 2 22: <world> killed Isgalamido by MOD_TRIGGER_HURT"
	    log_text_array = ['<world>', 'Isgalamido']
	    expect(log_text_array[0]).to eq('<world>')
	    expect(log_text_array[1]).to eq('Isgalamido')
	  end
  end

  describe "#death_infos" do
    it 'return the means of death in a game' do
    	test_array = ['A','A','A','A','B','B','C']
      expect(test_array.death_infos).to eq({'A' => 4, 'B' => 2, 'C' => 1})
    end
  end

end