# BANKSY

This is small project taking the Piggy banks from [Firefly III](https://github.com/firefly-iii/firefly-iii) 
and paring it to its minimum functionality. Why? Because I wanted to see if i could and it was the only feature
from Firefly I was using and it didn't make any sense to have the whole thing running on my server when I could
just have the little bit I needed.


## Hosting Requirements
- [Ruby](https://ruby-lang.org) 3.2.2
- [Rails 7](https://rubyonrails.org)
- [Postgresql](postgresql.org/) or some other database (just make sure to update the database.yml file)
- [Phusion Passenger](https://phusionpassenger.com)
- [Nodejs](https://nodejs.org)
- A webserver such as [Nginx](https://nginx.org) or [Apache](https://http://httpd.apache.org/)


You can of course, just run this project by cloning the repo and setting up some sort of job to keep
the rails server running in production mode and then point your webserver at it. I've chosen to use
[Capistrano](https://capistranorb.com/) for deploying it, so it can be deployed from a local machine 
to whatever server you're running it on.

### Setup
1. Following the [Go Rails](https://gorails.com/deploy/ubuntu/22.04#ruby) guide, install nodejs, rbenv, ruby-build, ruby, nginx, and Passenger on your webserver (you can skip installing Redis though, this project doesn't use it).
2. On your server in the home directory of the deploy user run `mkdir banksy`
3. Still on your server, `cd` into the banksy directory you just made, and create and edit the file `.rbenv-vars` with your favourite editor. You can use `dotenv.example` as a template
On your **local machine** after cloning the repo locally, setup Capistrano for deploying:
4. Copy `dotenv.example` using `cp dotenv.example .env` and edit `.env` to reflect the configuration for deploying on your server (especially the Capistrano config variables)
5. Run `bundle` to make sure your local environment is setup to deploy
6. Run `cap production deploy` if you're using Capistrano to deploy and hopefully everything should run and you'll now have a functioning instance of Banksy on your server!

### Questions?
Hopefully this is relatively straightforward to setup/deploy but if not i'll do my best to try and help where i can. The deploy setup was basically done by following the Go Rails
guide I linked above so honestly that's probably your best bet if you run into any issues deploying it via Capistrano.

### Other Bits/Attribution:
- The User registration/confirmation/session system is taken from Steve Polito's excellent [Rails Authentication From Scratch](https://stevepolito.design/blog/rails-authentication-from-scratch) because it the first/nicest walkthrough I could find that wasn't about 10 years out of date (love you Railscasts but that code 
definitely doesn't work anymore.. at least none of the code I could find)
- Firefly III is a nice accounting/budgeting app if you need a whole setup, I just don't and found myself dreading the data entry to keep it up to date
