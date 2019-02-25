require_relative "log_parser" 
require_relative "game" 

class Player
  # MATCHER = /.+ClientUserinfoChanged:.+n\\(?<name>[\w\s]+)\\t/ # player_infos

  attr_accessor :name, :kills

  def initialize(player)
    @name = player[:name]
    @kills = 0
  end

  def player_infos
    # :player_name >> |any char until Client| |any char until n\| |name| |ranges from words and spaces| |\t|
    players_names = scan(/.+ClientUserinfoChanged:.+n\\(?<name>[\w\s]+)\\t/).uniq
    # :player_id >> |space| |id| |1 or more digits| |space| |n\|
    # :player_name >> |n\| |name| |ranges from words and spaces| |\t|
    # games.scan(/\s(?<id>\d)\sn\\(?<name>[\w\s]+)\\t/).uniq
  end

  def add_kills(kills)
    Game.killer_infos.each do |match|
      if Game.killer_infos[:killer] == player_infos[:name] # <world> is not a player and should not appear in the list of players and even the kills in the dictionary.
        player.kills += 1 
      elsif Game.killer_infos[:killer] == '<world>' && Game.killer_infos[:victim] == player_infos[:name] # When <world> kills the player, the player gains -1 kill score.
        player.kills -= 1 
      end
    end
  end

  # def player_kills
  #   player_infos.each do |player_info|
  #     { name: players_names, kills:  }
  #   end
  # end

  # Player 1 = {
  #   name => "Zeh"
  #   kills => 1 (2 -1)
  # }

  # Player 2 = {
  #   name => "Isgalamido"
  #   kills => 0
  # }

end