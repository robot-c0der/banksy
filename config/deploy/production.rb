server '159.203.14.4', user: 'autodep', roles: %w{app db web}


 set :ssh_options, {
   keys: %w(/home/ashe/.ssh/autodep-mail_id_rsa),
   forward_agent: false,
 }
