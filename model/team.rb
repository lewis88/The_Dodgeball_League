require_relative( 'pokemon.rb' )

class Team

  attr_accessor :id, :name, :team_points

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @team_points = options['team_points'].to_i
  end

  # This refers to the method pokemons as it requires the hash from the
  # pokemons method. get_health gets the total health of the pokemons in the team
  def get_health( result )
    total_health = 0
    for pokemons in result
      total_health += result['health']
    end
    return total_health
  end

  def pokemons
    sql = "SELECT p.* FROM pokemons p
           INNER JOIN pokemons_teams pt
           ON pt.pokemon_id = pokemons.id
           WHERE team_id = #{@id};"
    return Pokemon.map_items( sql )
  end

  def save
    sql = "INSERT INTO teams (name, team_points)
          VAlUES ('#{@name}', #{@team_points}) RETURNING *"
    return Team.map_item(sql)
  end

  def self.all
    sql = "SELECT * FROM teams"
    return Team.map_items(sql)
  end

  def self.delete_all
    sql = "DELETE FROM teams"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    teams = SqlRunner.run(sql)
    result = teams.map { |team| Team.new( team ) }
    return result
  end

  def self.map_item(sql)
    result = Team.map_items(sql)
    return result.first
  end


end
