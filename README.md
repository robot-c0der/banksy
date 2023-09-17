# BANKSY

A ripoff and pared back version of the Piggy banks from [Firefly III](https://github.com/firefly-iii/firefly-iii) because that was the only
feature I was using and it seemed silly to have the whole thing setup for one little piece.


## Requirements
- Ruby 3.2.2
- Rails 7
- Postgresql (though you could probably use whatever db you want, this doesn't use any postgres-specific features)
- Capistrano

## Deployment
This uses Capistrano to deploy, you'll need to edit the deploy files to make it work for your situation, I've
definitely customized some things so they work for my specific setup...
