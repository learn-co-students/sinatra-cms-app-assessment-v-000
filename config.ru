require './config/environment'


use Rack::MethodOverride
run ApplicationController
use UsersController
use SleeplogsController
user EnergylogsController
