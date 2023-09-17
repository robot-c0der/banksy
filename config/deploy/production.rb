server '159.203.14.4', user: 'autodep', roles: %w{app db web}

set :passenger_restart_with_touch, true

 set :ssh_options, {
   keys: %w(/home/ashe/.ssh/autodep-mail_id_rsa),
   forward_agent: false,
 }
