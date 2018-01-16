require 'config/environment'

use Rack::Static, :urls => ['/css'], :root => 'public' # Rack fix allows seeing the css folder.

use Rack::MethodOverride
use VenuesController
use MusiciansController
run ApplicationController
