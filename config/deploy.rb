set :application, "horaextra"
set :cliente, "planb"
set :repository,  "https://github.com/adrianogodoy/horaextra.git"

set :deploy_to, "/home/ubuntu/www/#{cliente}/#{application}"

set :ssh_options, { :forward_agent => true }

set :scm, :git 

role :web, "alzir.planb.net.br"                          # Your HTTP server, Apache/etc
role :app, "alzir.planb.net.br"                          # This may be the same as your `Web` server
role :db,  "alzir.planb.net.br", :primary => true # This is where Rails migrations will run
role :db,  "alzir.planb.net.br"

set :user, "ubuntu"
set :use_sudo, false

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end