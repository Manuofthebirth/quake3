require_relative "log_parser" 
require_relative "player" 

class Game
	attr_accessor :game_match, :players, :total_kills, :means_of_death

	def initialize(game_log_text)
		@game_match = game_log_text
    @players = []
    @total_kills = 0
    @means_of_death = {}
	end

  def total_players
    # :players names >> |any char until Client| |any char until n\| |name| |ranges from words and spaces| |\t|
    players_names = game_match.scan(/.+ClientUserinfoChanged:.+n\\(?<name>[\w\s]+)\\t/).uniq
    players << players_names.flatten
    # :player_id >> |space| |id| |1 or more digits| |space| |n\|
    # :player_name >> |n\| |name| |ranges from words and spaces| |\t|
    # games.scan(/\s(?<id>\d)\sn\\(?<name>[\w\s]+)\\t/).uniq
  end

	def kill_events
		# :killer >> |any char until Kill| |any char until :| |any char with killer name| |space| 
		# :victim >> |space| |"killed"| |any char with victim name| |ranges from words and spaces| |by|
    player_deaths = game_match.scan(/.+Kill:.+:\s*(?<killer>.+?)\skilled\s(?<victim>[\w\s]+)?by/)
  end

  def killer_infos
    kill_events.map do |kill_event|
      { killer: kill_event[0], victim: kill_event[1] }
    end
  end

  def death_infos
    # :means_of_death >> |any char until ... space, repeat| |any char with means of death|
    kill_methods = game_match.scan(/.+Kill:.+:\s*.+\skilled\s.+\sby\s(?<means_of_death>.+)/)
    kill_methods.group_by{|e| e}.map{|k, v| [k, v.length]}.to_h
  end


  # def game_info
  #   index = 1
  #   @results = {}

  #   @game_match.each do |game|
  #     if game.any?
  #       @results.merge!(
  #         "Game_#{index}" => {
  #         total_kills: game.kill_event.size # count number of kill events
  #         players: game.total_players,
  #         kills: # player_kills(kills)
  #         means_of_death: game.death_info
  #       }
  #       )
  #       index += 1
  #     end
  #   end
  #   @results
  # end

end


  # Kill event 1 = {
  #   "killer" => "Zeh",
  #   "victim" => "Dono da Bola"
  #   "means_of_death" => "MOD_SHOTGUN"  
  # }

  # Kill event 2 = {
  #   "killer" => "Zeh",
  #   "victim" => "Isgalamido"
  #   "means_of_death" => "MOD_SHOTGUN" 
  # }

  # Kill event 3 = {
  #   "killer" => "<world>",
  #   "victim" => "Zeh"
  #   "means_of_death" => "MOD_GRENADE"
  # }

  # Player 1 = {
  #   name => "Zeh"
  #   kills => 1 (2 -1)
  # }

  # Player 2 = {
  #   name => "Isgalamido"
  #   kills => 0
  # }

  # Result:

  # Game 1 = {
  #   total_kills = 3
  #   player_kills = {"Zeh" => 1, "Isgalamido" => 0}
  #   means_of_death = {"MOD_SHOTGUN" => 2, "MOD_GRENADE" => 1}
  #   }
  # end