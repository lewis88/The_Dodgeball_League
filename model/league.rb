#------------------------------------------------------------------------------#
# The League class:
# Function 1 - dictates the order in which games are played.
# An array of 'team' objects are passed to the league class and the league class
# sorts it into matches to be played.
# Function 2 - To keep track of the points each team aquires so league analysis
# can be determined.
#------------------------------------------------------------------------------#

require_relative('../db/sqlrunner.rb' )
require_relative( 'match.rb' )
require_relative( 'team.rb' )

class League

  attr_accessor :teams

  def initialize( teams )
    @teams = teams
  end

#------------------------------------------------------------------------------#
# new_league function drops the previous league table and initializes our
# database for a fresh game.
#------------------------------------------------------------------------------#

  # def new_league
  #
  # end

#------------------------------------------------------------------------------#
# initial_matches function shuffles the passed array of teams and arranges the
# first matches to be played @team[0] plays @team[1], @team[2] plays @team[3]etc
#------------------------------------------------------------------------------#

  def round_1
    i = 0
    round1_array = []
    @teams = @teams.shuffle

    while i < @teams.length
      match = Match.new( { 'team1_id' => @teams[i].id , 'team2_id' => @teams[i+1].id } )
      round1_array << match
      i += 2
    end

    for match in round1_array
      match.play
      match.save
    end

  end

#------------------------------------------------------------------------------#
# new_round funcion will decide the second round and the following rounds to be
# played. It needs to take in the initial number and calculate the remaining
# matches to be played.
#------------------------------------------------------------------------------#

  def round_2
    sql = "SELECT * FROM teams WHERE team_points > 0"
    teams = Team.map_items( sql )

    round2_array = []
    i = 0
    while i < teams.length
      match = Match.new( { 'team1_id' => teams[i].id , 'team2_id' => teams[i+1].id } )
      round2_array << match
      i += 2
    end

    for match in round2_array
      match.play
      match.save
    end

  end

  def round_3
    sql = "SELECT * FROM teams WHERE team_points = 4"
    teams = Team.map_items( sql )

    match = Match.new( { 'team1_id' => teams[0].id, 'team2_id' => teams[1].id } )
    match.play
    match.save
  end

  # def round_4
  #   sql = "SELECT * FROM teams WHERE team_points = 6"
  #   teams = Team.map_items( sql )

  def save
    sql = "INSERT INTO leagues
           (team1_id, team2_id, team1_score, team2_score, team1_points, team2_points)
           VALUES
           ( #{@team1_id}, #{@team2_id}, #{@team1_score}, #{@team2_score},
           #{@team1_points}, #{@team2_points} )
           RETURNING *"
    return Match.map_item(sql)
  end

  def self.all()
    sql = "SELECT * FROM leagues"
    return Match.map_items(sql)
  end

  def self.delete_all
    sql = "DELETE FROM leagues"
    SqlRunner.run(sql)
  end

end
