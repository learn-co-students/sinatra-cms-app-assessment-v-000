ENV['SINATRA_ENV'] ||= "development"

<<<<<<< HEAD
require 'rack-flash'
=======
>>>>>>> 3fa39cf7bcb96c9b5487dd8830c5f6ecae00750c
require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require_all 'app'
