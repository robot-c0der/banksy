# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"


require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

require "capistrano/rails"
require "capistrano/rbenv"
require "capistrano/passenger"


require 'dotenv/load'

set :rbenv_type, :user
set :rbenv_ruby, '3.4.1'

set :passenger_restart_with_touch, true

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
