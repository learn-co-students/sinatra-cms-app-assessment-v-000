$:.unshift '.'
require 'config/environment'

use Rack::Static

use Rack::MethodOverride
use VenuesController
use MusiciansController
run ApplicationController
