require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require( 'json' ) # require java script object notation
require_relative( 'model/league.rb' )

get '/home' do
  erb( :home )
end

get '/new-game' do
  erb( :new_game )
end


post '/login' do # login will submit details and check if they exist already
  username = params[:username]
  password = params[:password]
end

post '/new-user' do # new user creates new account
  erb( :new_user )
end


get '/new-game' do # new-game starts a new game once logged in (assigned to specific person)

  erb( :new_game )
end
