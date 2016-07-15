DROP TABLE matches;
DROP TABLE teams;
DROP TABLE pokemons;
DROP TABLE leagues;

CREATE TABLE pokemons (
  id serial4 primary key,
  name VARCHAR(255),
  type VARCHAR(255),
  weak_type VARCHAR(255),
  attack INT4,
  health INT4,
  hit INT4,
  dodge INT4
);

CREATE TABLE teams (
  id serial4 primary key,
  name VARCHAR(255),
  team_points int4
);

CREATE TABLE pokemons_teams (
  id serial4 primary key,
  pokemon_id int4 references pokemons(id),
  team_id int4 references teams(id)
);

CREATE TABLE matches (
  id serial4 primary key,
  team1_id int4 references teams(id),
  team2_id int4 references teams(id),
  team1_score int4,
  team2_score int4
);

-- CREATE TABLE leagues (
--   id serial4 primary key,
--   name VARCHAR(255),
-- );
