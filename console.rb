require_relative( 'model/pokemon.rb' )
require_relative( 'model/team.rb' )
require_relative( 'model/pokemon_team.rb')
require_relative( 'model/match.rb')
require_relative( 'model/league.rb')

require( 'pry-byebug' )

Match.delete_all
PokemonTeam.delete_all
Team.delete_all
Pokemon.delete_all

# pokemon.new name, type, health, hit-chance, weak-type
pokemon1 = Pokemon.new( { 'name' => 'Bulbasaur', 'type' => 'grass', 'weak_type' => 'fire', 'attack' => 8, 'health' => 20, 'hit' => 70, 'dodge' => 30 } )
pokemon2 = Pokemon.new( { 'name' => 'Charmander', 'type' => 'fire', 'weak_type' => 'water', 'attack' => 12, 'health' => 15, 'hit' => 80, 'dodge' => 40 } )
pokemon3 = Pokemon.new( { 'name' => 'Squirtle', 'type' => 'water', 'weak_type' => 'grass', 'attack' => 6, 'health' => 25, 'hit' => 70, 'dodge' => 20 } )
pokemon4 = Pokemon.new( { 'name' => 'Butterfree', 'type' => 'poison', 'weak_type' => 'rock', 'attack' => 10, 'health' => 12, 'hit' => 80, 'dodge' => 60  } )
pokemon5 = Pokemon.new( { 'name' => 'Beedrill', 'type' => 'poison', 'weak_type' => 'rock', 'attack' => 10, 'health' => 12, 'hit' => 80, 'dodge' => 60 } )
pokemon6 = Pokemon.new( { 'name' => 'Pidgey', 'type' => 'normal', 'weak_type' => 'poison', 'attack' => 9, 'health' => 12, 'hit' => 80, 'dodge' => 60 } )
pokemon7 = Pokemon.new( { 'name' => 'Raticate', 'type' => 'normal', 'weak_type' => 'electric', 'attack' => 8, 'health' => 15, 'hit' => 70, 'dodge' => 30 } )
pokemon8 = Pokemon.new( { 'name' => 'Ekans', 'type' => 'poison', 'weak_type' => 'rock', 'attack' => 11, 'health' => 15, 'hit' => 70, 'dodge' => 30 } )
pokemon9 = Pokemon.new( { 'name' => 'Pikachu', 'type' => 'electric', 'weak_type' => 'poison', 'attack' => 11, 'health' => 12, 'hit' => 80, 'dodge' => 60 } )
pokemon10 = Pokemon.new( { 'name' => 'Psyduck', 'type' => 'psychic', 'weak_type' => 'ghost', 'attack' => 13, 'health' => 12, 'hit' => 90, 'dodge' => 30 } )
pokemon11 = Pokemon.new( { 'name' => 'Ponyta', 'type' => 'fire', 'weak_type' => 'water', 'attack' => 12, 'health' => 14, 'hit' => 80, 'dodge' => 50 } )
pokemon12 = Pokemon.new( { 'name' => 'Mankey', 'type' => 'normal', 'weak_type' => 'electric', 'attack' => 9, 'health' => 20, 'hit' => 70, 'dodge' => 40 } )
pokemon13 = Pokemon.new( { 'name' => 'Magmar', 'type' => 'fire', 'weak_type' => 'water', 'attack' => 11, 'health' => 15, 'hit' => 70, 'dodge' => 20 } )
pokemon14 = Pokemon.new( { 'name' => 'Ninetales', 'type' => 'fire', 'weak_type' => 'water', 'attack' => 12, 'health' => 12, 'hit' => 80, 'dodge' => 50 } )
pokemon15 = Pokemon.new( { 'name' => 'Jigglypuff', 'type' => 'normal', 'weak_type' => 'poison', 'attack' => 10, 'health' => 15, 'hit' => 70, 'dodge' => 30 } )
pokemon16 = Pokemon.new( { 'name' => 'Magikarp', 'type' => 'water', 'weak_type' => 'grass', 'attack' => 30, 'health' => 100, 'hit' => 100, 'dodge' => 30 } )
pokemon17 = Pokemon.new( { 'name' => 'Vileplume', 'type' => 'grass', 'weak_type' => 'fire', 'attack' => 10, 'health' => 20, 'hit' => 70, 'dodge' => 20 } )
pokemon18 = Pokemon.new( { 'name' => 'Geodude', 'type' => 'rock', 'weak_type' => 'grass', 'attack' => 10, 'health' => 20, 'hit' => 60, 'dodge' => 20 } )
pokemon19 = Pokemon.new( { 'name' => 'Venomoth', 'type' => 'poison', 'weak_type' => 'rock', 'attack' => 12, 'health' => 15, 'hit' => 60, 'dodge' => 30 } )
pokemon20 = Pokemon.new( { 'name' => 'Gengar', 'type' => 'ghost', 'weak_type' => 'normal', 'attack' => 13, 'health' => 20, 'hit' => 80, 'dodge' => 70 } )
pokemon21 = Pokemon.new( { 'name' => 'Chansey', 'type' => 'normal', 'weak_type' => 'electric', 'attack' => 8, 'health' => 20, 'hit' => 70, 'dodge' => 40 } )


p1 = pokemon1.save
p2 = pokemon2.save
p3 = pokemon3.save
p4 = pokemon4.save
p5 = pokemon5.save
p6 = pokemon6.save
p7 = pokemon7.save
p8 = pokemon8.save
p9 = pokemon9.save
p10 = pokemon10.save
p11 = pokemon11.save
p12 = pokemon12.save
p13 = pokemon13.save
p14 = pokemon14.save
p15 = pokemon15.save
p16 = pokemon16.save
p17 = pokemon17.save
p18 = pokemon18.save
p19 = pokemon19.save
p20 = pokemon20.save
p21 = pokemon21.save

team1 = Team.new( { 'name' => 'Pokekillers' } )
team2 = Team.new( { 'name' => 'Pokecritters' } )
team3 = Team.new( { 'name' => 'Pokedots' } )
team4 = Team.new( { 'name' => 'Pokesquares' } )
team5 = Team.new( { 'name' => 'Pokenots' } )
team6 = Team.new( { 'name' => 'Pokehitters' } )
team7 = Team.new( { 'name' => 'Pokefire' } )
team8 = Team.new( { 'name' => 'Pokehate' } )

t1 = team1.save
t2 = team2.save
t3 = team3.save
t4 = team4.save
t5 = team5.save
t6 = team6.save
t7 = team7.save
t8 = team8.save

pt1 = PokemonTeam.new( { 'pokemon_id' => p1.id, 'team_id' => t1.id } )
pt2 = PokemonTeam.new( { 'pokemon_id' => p2.id, 'team_id' => t1.id } )
pt3 = PokemonTeam.new( { 'pokemon_id' => p3.id, 'team_id' => t1.id } )
pt4 = PokemonTeam.new( { 'pokemon_id' => p4.id, 'team_id' => t2.id } )
pt5 = PokemonTeam.new( { 'pokemon_id' => p5.id, 'team_id' => t2.id } )
pt6 = PokemonTeam.new( { 'pokemon_id' => p6.id, 'team_id' => t2.id } )

pt7 = PokemonTeam.new( { 'pokemon_id' => p7.id, 'team_id' => t3.id } )
pt8 = PokemonTeam.new( { 'pokemon_id' => p8.id, 'team_id' => t3.id } )
pt9 = PokemonTeam.new( { 'pokemon_id' => p9.id, 'team_id' => t3.id } )
pt10 = PokemonTeam.new( { 'pokemon_id' => p1.id, 'team_id' => t4.id } )
pt11 = PokemonTeam.new( { 'pokemon_id' => p2.id, 'team_id' => t4.id } )
pt12 = PokemonTeam.new( { 'pokemon_id' => p3.id, 'team_id' => t4.id } )

o1 = pt1.save()
o2 = pt2.save()
o3 = pt3.save()
o4 = pt4.save()
o5 = pt5.save()
o6 = pt6.save()
o7 = pt7.save()
o8 = pt8.save()
o9 = pt9.save()
o10 = pt10.save()
o11 = pt11.save()
o12 = pt12.save()

binding.pry

team_array  = [ t1, t2, t3, t4, t5, t6, t7, t8]

league1 = League.new( team_array )

league1.round_1

league1.round_2


# match1 = Match.new( {'team1_id' => t1.id, 'team2_id' => t2.id } )
# match2 = Match.new( {'team1_id' => t2.id, 'team2_id' => t3.id } )
# match3 = Match.new( {'team1_id' => t4.id, 'team2_id' => t1.id } )
# match4 = Match.new( {'team1_id' => t3.id, 'team2_id' => t4.id } )

# match1.play
# match2.play
# match3.play
# match4.play
#
# m1 = match1.save
# m2 = match2.save
# m3 = match3.save
# m4 = match4.save
#
#
# t1.pokemons.each { |pokemon| pokemon.name }
# pokemons_name = t1.pokemons.map { |pokemon| { name: pokemon.name, id: pokemon.id} }
