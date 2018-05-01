require './config/environment'

use Rack::MethodOverride
use ClientsController
use ProductsController
use UsersController
run ApplicationController
