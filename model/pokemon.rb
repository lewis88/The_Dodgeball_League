require_relative('../db/sqlrunner.rb')

class Pokemon

  attr_accessor :id, :name, :type, :weak_type, :health, :hit

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @type = options['type']
    @weak_type = options['weak_type']
    @attack = options['attack'].to_i
    @health = options['health'].to_i
    @hit = options['hit'].to_i
    @dodge = options['dodge'].to_i
  end

  def save()
    sql = "INSERT INTO pokemons (name, type, weak_type, health, hit, dodge)
           VALUES ('#{@name}', '#{@type}', '#{@weak_type}', #{@health}, #{@hit}, #{@dodge})
           RETURNING *"
    return Pokemon.map_item(sql)
  end

  def self.all()
    sql = "SELECT * FROM pokemons"
    return Pokemon.map_items(sql)
  end

  def self.delete_all
    sql = "DELETE FROM pokemons"
    SqlRunner.run(sql)
  end

  def teams
    sql = "SELECT t.* FROM teams t
           INNER JOIN pokemons_teams pt
           ON pt.team_id = t.id
           WHERE pokemon_id = #{@id}"
    return Team.map_items(sql)
  end

  def self.map_items(sql)
    pokemons = SqlRunner.run(sql)
    result = pokemons.map { |pokemon| Pokemon.new( pokemon ) }
    return result
  end

  def self.map_item(sql)
    result = Pokemon.map_items(sql)
    return result.first
  end

end
