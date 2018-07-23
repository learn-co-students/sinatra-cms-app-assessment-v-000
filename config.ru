require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

require_relative 'application/controllers/users_controller'
require_relative 'application/controllers/recommendations_controller'

use Rack::MethodOverride

use RecommendationsController
use UsersController
run ApplicationController
