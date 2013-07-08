require "bundler/capistrano"

load "config/recipes/base"
load "config/recipes/apachevhost"

server "75.98.173.74", :web, :app, :db, primary: true

set :user, "deploy"
set :domain, "valleysummit.stagingarea.us"
set :application, "valleysummit"
set :deploy_to, "/var/www/#{application}/app"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:alnutile/#{application}.git"
set :branch, "development"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases
