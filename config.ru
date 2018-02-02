require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
<<<<<<< HEAD


use UsersController
use WorkoutsController
=======
use GolfClubsController 
use GolfBagsController  
use UsersController   
>>>>>>> 3fa39cf7bcb96c9b5487dd8830c5f6ecae00750c
run ApplicationController
