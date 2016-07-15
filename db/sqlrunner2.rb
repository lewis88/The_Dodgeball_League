require( 'PG' )

class SqlRunner

  def self.run( sql )
      begin
        db = PG.connect( {dbname: 'poke_league', host: 'localhost'} )
        result = db.exec( sql )
      ensure
        db.close
      end
      return result
  end


  def self.new_game

    begin
      db = PG.connect( {dbname: 'poke_league', host: 'loclahost'} )

      db.exec "DROP TABLE IF EXISTS matches"
      db.exec "DROP TABLE IF EXISTS pokemons_teams"
      db.exec "DROP TABLE IF EXISTS teams"
      db.exec "DROP TABLE IF EXISTS pokemons"

      db.exec "CREATE TABLE pokemons (
               id serial4 primary key,
               name VARCHAR(255)
               )"

      db.exec "CREATE TABLE teams (
               id serial4 primary key,
               name VARCHAR(255),
               team_points int4
               )"

      db.exec "CREATE TABLE pokemons_teams (
               id serial4 primary key,
               pokemon_id int4 references pokemons(id),
               team_id int4 references teams(id)
               )"

      db.exec "CREATE TABLE matches (
               id serial4 primary key,
               team1_id int4 references teams(id),
               team2_id int4 references teams(id),
               team1_score int4,
               team2_score int4
               )"

      db.exec "INSERT INTO pokemons ()"

    ensure
          db.close
    end

  end

end
