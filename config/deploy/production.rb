server '159.203.14.4', user: 'autodep', roles: %w{app db web}


 set :ssh_options, {
   keys: "#{ENV['DEPLOY_SSH_KEY_PATH'].split(',')}",
   forward_agent: false,
 }
