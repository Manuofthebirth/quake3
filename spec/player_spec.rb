require 'spec_helper'
require_relative '../lib/log_parser'
require_relative '../lib/game'
require_relative '../lib/player'

describe Player do
	let(:player) { Player.new(id: 3, name: 'Isgalamido', kills: 4) }

  describe '#initialize' do
    it 'should create a new player instance' do
      expect(player).to be_an(Player)
    end

    it 'return the name of the player' do
      expect(player.name).to eq('Isgalamido')
    end
	end

  describe '#kills' do
    it 'return the kill score of the player' do
      expect(player.kills).to eq(4)
    end
  end

end