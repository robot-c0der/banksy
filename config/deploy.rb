# config valid for current version and patch releases of Capistrano
lock "~> 3.18"

set :application, "banksy"
set :repo_url, "#{ENV['CAP_DEPLOY_REPO']}"

# Deploy to user's home directory
set :deploy_to, "#{ENV['CAP_DEPLOY_PATH']}/#{fetch :application}"

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets',
'vendor/bundle', '.bundle', 'public/system'

# To save disk space only keep the last 5 releases
set :keep_releases, 5

# Set the git branch to pull from
set  :branch, 'main'
