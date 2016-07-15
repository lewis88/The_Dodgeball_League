require_relative('../db/sqlrunner.rb')

class PokemonTeam

  attr_accessor :id, :pokemon_id, :team_id

  def initialize(options)
    @id = options['id'].to_i
    @pokemon_id = options['pokemon_id'].to_i
    @team_id = options['team_id'].to_i
  end

  def save
    sql = "INSERT INTO pokemons_teams ( pokemon_id, team_id )
          VAlUES ( #{@pokemon_id}, #{@team_id} ) RETURNING *"
    return PokemonTeam.map_item( sql )
  end

  def self.all()
    sql = "SELECT * FROM pokemons_teams"
    return PokemonTeam.map_items( sql )
  end

  def self.delete_all()
    sql = "DELETE FROM pokemons_teams"
    SqlRunner.run( sql )
  end

  def self.map_items(sql)
    pokemons_teams = SqlRunner.run( sql )
    result = pokemons_teams.map { |pokemon_team| PokemonTeam.new( pokemon_team ) }
    return result
  end

  def self.map_item(sql)
    result = PokemonTeam.map_items(sql)
    return result.first
  end

end
