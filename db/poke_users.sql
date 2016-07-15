CREATE TABLE users (
  id SERIAL4 primary key,
  username VARCHAR(255),
  password VARCHAR(255),
)

CREATE TABLE games (
  id SERIAL4 primary key,
  first_favourite_pokemon VARCHAR(255),
  second_favourite_pokemon VARCHAR(255),
  third_favourite_pokemon VARCHAR(255),
  high_score int4,
  low_score int4,
  biggest_hit int4,
  weakest_hit int4,
  user_id references users(id)
)
