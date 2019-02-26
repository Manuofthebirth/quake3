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
    players_names = game_match.scan(/.+ClientUserinfoChanged:.+n\\(?<name>[\w\s]+)\\t/).uniq # extracting an array with unique values
    players << players_names.flatten
  end

	def kill_events
    game_match.scan(/.+Kill:.+:\s*(?<killer>.+?)\skilled\s(?<victim>[\w\s]+)?by/) # extracting an array with killer and victim from a kill event
  end

  def killer_infos
    kill_events.map do |kill_event|
      { killer: kill_event[0], victim: kill_event[1] } # defining killer and victim
    end
  end

  def death_infos
    kill_methods = game_match.scan(/.+Kill:.+:\s*.+\skilled\s.+\sby\s(?<means_of_death>.+)/)
    kill_methods.group_by{|e| e}.map{|k, v| [k, v.length]}.to_h # informing how many (and which) means of death happened during a game
  end

  def player_kills
    players.each_with_object({}) { |play, hsh| hsh[play.name] = play.kills } # defining players and kill scores
  end

  def games_results # what is shown in lib/task1 and lib/task2 
    index = 1
    @results = {}

    @game_match.each do |game|
      if game_match.any?
        @results.merge!(
          "Game_#{index}" => {
          total_kills: game.kill_events.size, # count number of kill events
          players: game.total_players,
          means_of_death: game.death_infos
        }
        )
        index += 1
      end
    end
    @results
  end

end
