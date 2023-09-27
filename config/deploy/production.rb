server "#{ENV['CAP_DEPLOY_SERVER_IP']}", user: "#{ENV['CAP_DEPLOY_USER']}", roles: %w{app db web}


 set :ssh_options, {
   keys: "#{ENV['DEPLOY_SSH_KEY_PATH'].split(',')}",
   forward_agent: false,
 }
