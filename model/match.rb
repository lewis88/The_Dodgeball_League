#------------------------------------------------------------------------------#
# The match class creates the join table between two teams and also simulates  #
# the match itself so that one team is claimed winner, the other loser, or a   #
# draw. Team scores are recorded and stored and league points are applied.     #
#------------------------------------------------------------------------------#

require_relative('../db/sqlrunner.rb')
require_relative('team.rb')

class Match

  attr_accessor :id, :team1_id, :team2_id,
                :team1_score, :team2_score

  def initialize( options )
    @id = options[ 'id' ].to_i
    @team1_id = options[ 'team1_id' ].to_i
    @team2_id = options[ 'team2_id' ].to_i
    @team1_score = options[ 'team1_score' ].to_i
    @team2_score = options[ 'team2_score' ].to_i
  end

  def play

    # @team1_score += rand(0 .. 10)
    # @team2_score += rand(0 .. 10)

    rota = [1, 0]
    coin_toss = rand(0 .. 1) # to see who goes first
    rota = [0, 1] if coin_toss == 1

    team1 = select_team( @team1_id ).pokemons
    team1_health = team1.get_health

    team2 = select_team( @team2_id ).pokemons
    team2_health = team2.get_health

    until team1_health <= 0 || team2_health <= 0
      j = 0
      while j < 3
        if rota[0] = 1
          team1[j].attack
        elsif rota[1] = 1
          team2[j].attack
        end
      rota = rota.reverse
      end
    end
  end

  # def attack( target )
  #
  #
  #
  # end

  # Need to randomize the number of points scored so someone wins
  # determines who won and gives the player some league points
  # If there are any draws at the end of a round of matches then the drawn team will
  # play again and or play another match until someone is named victorious.

  def update_points
    if @team1_score > @team2_score
      team1_points = 2
      team2_points = 0
    elsif @team2_score > @team1_score
      team1_points = 0
      team2_points = 2
    else
      team1_points = 2  # This will change later on when there will be a points accumulator
      team2_points = 0  # temporary result so the tournament can progress
    end
    sql = "UPDATE teams SET team_points = team_points + #{team1_points} WHERE id = #{@team1_id};
           UPDATE teams SET team_points = team_points + #{team2_points} WHERE id = #{@team2_id}"
    SqlRunner.run( sql )
  end

  def select_team( teamid ) # team1_id or team2_id
    sql = "SELECT * FROM teams WHERE id = #{teamid}"
    result = SqlRunner.run( sql )
    return Team.new( result )
  end

  def save
    sql = "INSERT INTO matches
           (team1_id, team2_id, team1_score, team2_score)
           VALUES
           ( #{@team1_id}, #{@team2_id}, #{@team1_score}, #{@team2_score} )
           RETURNING *"
    return Match.map_item( sql )
  end

  def self.all
    sql = "SELECT * FROM matches"
    return Match.map_items( sql )
  end

  def self.delete_all
    sql = "DELETE FROM matches"
    SqlRunner.run( sql )
  end

  def self.map_items(sql)
    matches = SqlRunner.run(sql)
    result = matches.map { |match| Match.new( match ) }
    return result
  end

  def self.map_item(sql)
    result = Match.map_items(sql)
    return result.first
  end

end
