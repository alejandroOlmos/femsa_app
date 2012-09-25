default_run_options[:pty] = true  # Must be set for the password prompt
                                  # from git to work

set :application, "femsa_app"
set :repository,  "git@github.com:alejandroOlmos/femsa_app.git"


set :scm, :git
set :user, "acm-1015134"  # The server's user for deploys
set :scm_passphrase, "jogabonit0."  # The deploy user's password
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :branch, 'master'
set :deploy_via, :remote_cache

set :deploy_to, "/home/acm-1015134/rails/FEMSA"

role :web, "ubiquitous.csf.itesm.mx"                          # Your HTTP server, Apache/etc
role :app, "ubiquitous.csf.itesm.mx"                          # This may be the same as your `Web` server
role :db,  "ubiquitous.csf.itesm.mx", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

set :use_sudo, false

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end