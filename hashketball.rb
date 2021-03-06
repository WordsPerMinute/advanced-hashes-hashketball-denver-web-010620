require 'pry'
#<<<<<<< HEAD

def game_hash
  {
    :away => {  :team_name => "Charlotte Hornets",
                :colors => ["Turquoise", "Purple"],
                :players => [
                  {:player_name => "Jeff Adrien",
                    :number => 4,
                    :shoe => 18,
                    :points => 10,
                    :rebounds => 1,
                    :assists => 1,
                    :steals => 2,
                    :blocks => 7,
                    :slam_dunks => 2
                  },
                  {:player_name => "Bismack Biyombo",
                    :number => 0,
                    :shoe => 16,
                    :points => 12,
                    :rebounds => 4,
                    :assists => 7,
                    :steals => 22,
                    :blocks => 15,
                    :slam_dunks => 10
                  },
                  {:player_name => "DeSagna Diop",
                    :number => 2,
                    :shoe => 14,
                    :points => 24,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 4,
                    :blocks => 5,
                    :slam_dunks => 5
                  },
                  {:player_name => "Ben Gordon",
                    :number => 8,
                    :shoe => 15,
                    :points => 33,
                    :rebounds => 3,
                    :assists => 2,
                    :steals => 1,
                    :blocks => 1,
                    :slam_dunks => 0
                  },
                  {:player_name => "Kemba Walker",
                    :number => 33,
                    :shoe => 15,
                    :points => 6,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 7,
                    :blocks => 5,
                    :slam_dunks => 12
                  },
                ]
            },
    :home => {  :team_name => "Brooklyn Nets",
                :colors => ["Black", "White"],
                :players => [
                  {:player_name => "Alan Anderson",
                    :number => 0,
                    :shoe => 16,
                    :points => 22,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 1
                  },
                  {:player_name => "Reggie Evans",
                    :number => 30,
                    :shoe => 14,
                    :points => 12,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 12,
                    :blocks => 12,
                    :slam_dunks => 7
                  },
                  {:player_name => "Brook Lopez",
                    :number => 11,
                    :shoe => 17,
                    :points => 17,
                    :rebounds => 19,
                    :assists => 10,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 15
                  },
                  {:player_name => "Mason Plumlee",
                    :number => 1,
                    :shoe => 19,
                    :points => 26,
                    :rebounds => 11,
                    :assists => 6,
                    :steals => 3,
                    :blocks => 8,
                    :slam_dunks => 5
                  },
                  {:player_name => "Jason Terry",
                    :number => 31,
                    :shoe => 15,
                    :points => 19,
                    :rebounds => 2,
                    :assists => 2,
                    :steals => 4,
                    :blocks => 11,
                    :slam_dunks => 1
                  },
                ]
            }
    }
  end

def num_points_scored(players_name)
  #return playp later
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == players_name
            return player[:points]
          end
        end
      end
    end
  end
end

def shoe_size(players_name)
  game_hash.each do |place, team|
      team.each do |attribute, data|
        if attribute == :players
          data.each do |player|
            if player[:player_name] == players_name
              return player[:shoe]
            end
          end
        end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end

def team_names
  game_hash.map do |place, team|
    team[:team_name]
  end
end

def player_numbers(team_name)
  nums = []
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      team.each do |attributes, data|
        if attributes == :players
          data.each do |player|
            nums << player[:number]
          end
        end
      end
    end
  end
  nums
end

def player_stats(players_name)
  new_hash = {}
  game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
          if player[:player_name] == players_name
            new_hash = player.delete_if do |k, v|
              k == :player_name
            end
          end
        end
      end
    end
  end
  new_hash
end

# def big_shoe_rebounds(players_name)
#   game_hash.each do |place, team|
#     team.each do |attribute, data|
#       if attribute == :players
#         data.each do |player|
#           if player[:player_name] == players_name
#             return player[:shoe]
#           end
#         end
#       end
#     end
#   end
# end

def big_shoe_rebounds
  largestShoe = 0
  rebounds = 0
  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      if player[:shoe] > largestShoe
        largestShoe = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end
  return rebounds
end

def most_points_scored
  playerName = ""
  mostPoints = 0
  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      if player[:points] > mostPoints
        playerName = player[:player_name]
        mostPoints = player[:points]
      end
    end
  end
  return playerName
end

def winning_team
  winningTeamName = ""
  awayPointsTotal = 0
  homePointsTotal = 0
  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      if team_info[:team_name] == "Charlotte Hornets"
        awayPointsTotal += player[:points]
      elsif team_info[:team_name] == "Brooklyn Nets"
        homePointsTotal += player[:points]
      else
        puts "TRY AGAIN, didn't get we what we wanted =)"
      end
    end
  end
  if awayPointsTotal > homePointsTotal
    return "Charlotte Hornets"
  elsif homePointsTotal > awayPointsTotal
    return "Brooklyn Nets"
  else
    return "TRY AGAIN, didn't get we what we wanted =)"
  end
end

def player_with_longest_name
  playerLongestName = ""
  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      if player[:player_name].length > playerLongestName.length
        playerLongestName = player[:player_name]
      end
    end
  end
  return playerLongestName
end

def long_name_steals_a_ton?
  mostStealPlayer = ""
  mostSteals = 0
  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      if player[:steals] > mostSteals
        mostStealPlayer = player[:player_name]
        mostSteals = player[:steals]
      end
    end
  end
  
  if player_with_longest_name == mostStealPlayer
    return true 
  else
    return false
  end
end

