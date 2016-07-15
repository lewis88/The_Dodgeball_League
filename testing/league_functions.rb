#------------------------------------------------------------------------------#
# initial_matches function shuffles the passed array of teams and arranges the
# first matches to be played @team[0] plays @team[1], @team[2] plays @team[3]etc
# Testing to see if initial_matches works how I want, matches are placed in a
# hash with keys: match_1, match_2 .. etc
#------------------------------------------------------------------------------#
require_relative( '../model/team.rb')
require_relative( '../model/match.rb')

# def initial_matches( teams )
#   i = 0
#   round_1 = {}
#   teams = teams.shuffle
#   while i < teams.length
#     match = [ teams[i], teams[i+1] ]
#     round_1.store( "match_#{i+1}", match)
#     i += 2
#   end
#  return round_1
# end
#
# team_array = [ {"team_id" => 1}, {"team_id" => 2}, {"team_id" => 3}, {"team_id" => 4} ]
#
# puts initial_matches( team_array )

#------------------------------------------------------------------------------#

def initial_matches(teams)
  i = 0
  round_1 = []
  teams = teams.shuffle

  while i < teams.length
    match = Match.new( teams[i], teams[i+1])
    i += 2
  end

  for match in round_1
    match.play
    # match.save
  end
end

team_array = [ {"team_id" => 1}, {"team_id" => 2}, {"team_id" => 3}, {"team_id" => 4} ]

initial_matches( team_array )
