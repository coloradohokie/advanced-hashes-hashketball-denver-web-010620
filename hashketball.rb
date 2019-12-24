def game_hash
  nds = {home: {  team_name: "Brooklyn Nets",
                  colors: ["Black", "White"],
                  players: [{player_name: "Alan Anderson",
                              number: 0,
                              shoe: 16,
                              points: 22,
                              rebounds: 12,
                              assists: 12,
                              steals: 3,
                              blocks: 1,
                              slam_dunks: 1},
                              
                              {player_name: "Reggie Evans",
                              number: 30,
                              shoe: 14,
                              points: 12,
                              rebounds: 12,
                              assists: 12,
                              steals: 12,
                              blocks: 12,
                              slam_dunks: 7},
                              
                              {player_name: "Brook Lopez",
                              number: 11,
                              shoe: 17,
                              points: 17,
                              rebounds: 19,
                              assists: 10,
                              steals: 3,
                              blocks: 1,
                              slam_dunks: 15},
                              
                              {player_name: "Mason Plumlee",
                              number: 1,
                              shoe: 19,
                              points: 26,
                              rebounds: 11,
                              assists: 6,
                              steals: 3,
                              blocks: 8,
                              slam_dunks: 5},
                              
                              {player_name: "Jason Terry",
                              number: 31,
                              shoe: 15,
                              points: 19,
                              rebounds: 2,
                              assists: 2,
                              steals: 4,
                              blocks: 11,
                              slam_dunks: 1}]
                }, #close home top level key
          
          away: { team_name: "Charlotte Hornets",
                  colors: ["Turquoise", "Purple"],
                  players: [{player_name: "Jeff Adrien",
                              number: 4,
                              shoe: 18,
                              points: 10,
                              rebounds: 1,
                              assists: 1,
                              steals: 2,
                              blocks: 7,
                              slam_dunks: 2},
                              
                              {player_name: "Bismack Biyombo",
                              number: 0,
                              shoe: 16,
                              points: 12,
                              rebounds: 4,
                              assists: 7,
                              steals: 22,
                              blocks: 15,
                              slam_dunks: 10},
                              
                              {player_name: "DeSagna Diop",
                              number: 2,
                              shoe: 14,
                              points: 24,
                              rebounds: 12,
                              assists: 12,
                              steals: 4,
                              blocks: 5,
                              slam_dunks: 5},
                              
                              {player_name: "Ben Gordon",
                              number: 8,
                              shoe: 15,
                              points: 33,
                              rebounds: 3,
                              assists: 2,
                              steals: 1,
                              blocks: 1,
                              slam_dunks: 0},
                              
                              {player_name: "Kemba Walker",
                              number: 33,
                              shoe: 15,
                              points: 6,
                              rebounds: 12,
                              assists: 12,
                              steals: 7,
                              blocks: 5,
                              slam_dunks: 12}]
                  } #close away top level key
          
        } #close nds hash
        
  return nds
end




def num_points_scored(name)
#This method takes a player's name and returns the number of points they scored
  
  game_hash.each do | homeaway, team_attrib |
    game_hash[homeaway][:players].each do |value|
      if value[:player_name] == name
        return value[:points]
      end #if
    end # block
  end # game_hash.each block
end #method




def shoe_size(name)
#This method takes a player's name and returns the shoe size for that player  
  
  game_hash.each do | homeaway, team_attrib |
    game_hash[homeaway][:players].each do |value|
      if value[:player_name] == name
        return value[:shoe]
      end #if
    end # block
  end # game_hash.each block
end #method


def team_colors(team_name)
#This method takes a team name and returns the team's colors  
  
  game_hash.each do | homeaway, team_attrib |
    if game_hash[homeaway][:team_name] == team_name
      return game_hash[homeaway][:colors]
      end #if
    end # block
end #method


def team_names
#this method takes the game hash and returns the team names.  
  teams = []
  game_hash.each do |homeaway, team_attrib|
    teams << game_hash[homeaway][:team_name]
  end #each block
  return teams
end #method


def player_numbers(team_name)
#This method takes a team name and returns the player numbers for that team.  
  
  numbers = []
  game_hash.each do | homeaway, team_attrib |
    if game_hash[homeaway][:team_name] == team_name
      game_hash[homeaway][:players].map.with_index do |v,i|
        numbers << game_hash[homeaway][:players][i][:number]
      end #block
    end #if
  end #outer block
  return numbers
end #method




def player_stats(player_name)
#This method takes a player's name and returns a hash of that player's stats  
  player_hash = {}
  game_hash.each do | homeaway, team_attrib |
    game_hash[homeaway][:players].each do |value|
      if value[:player_name] == player_name
        value.delete(:player_name)
        return value
      end #if
    end # block
  end # game_hash.each block
end #method


def big_shoe_rebounds
#This method returns the  number of rebounds from the player that has the largest shoe size  
  home_max_shoe_player = game_hash[:home][:players].max_by { |v| v[:shoe] }
  home_max_shoe_size = home_max_shoe_player[:shoe]
  away_max_shoe_player = game_hash[:away][:players].max_by { |v| v[:shoe] }
  away_max_shoe_size = away_max_shoe_player[:shoe]
   if home_max_shoe_size > away_max_shoe_size
     return home_max_shoe_player[:rebounds]
    else
     return away_max_shoe_player[:rebounds]
    end #if/else
end #method


def most_points_scored
#This method returns the name of the player who scored the most points in the game.
  home_max_point_player = game_hash[:home][:players].max_by { |v| v[:points] }
  home_max_points = home_max_point_player[:points]
  away_max_point_player = game_hash[:away][:players].max_by { |v| v[:points] }
  away_max_points = away_max_point_player[:points]
  if home_max_points > away_max_points
    return home_max_point_player[:player_name]
  else
    return away_max_point_player[:player_name]
  end #if/else
end #method

def winning_team
  home_total_points = 0
  game_hash[:home][:players].each_with_index do |v, i|
    home_total_points += game_hash[:home][:players][i][:points]
  end
  
  away_total_points = 1
  game_hash[:away][:players].each_with_index do |v, i|
    away_total_points += game_hash[:home][:players][i][:points]
  end
  
  if home_total_points > away_total_points
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
  
  p "HOme"
  p home_total_points
  p away_total_points
  
end

