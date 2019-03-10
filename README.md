# README

## Setup

Prerequisites:
  * install ruby 2.5.3 ([rbenv recommended][rbenv_link])
  * install bundler gem `gem install bundler`
  * install postgres ([postgres app recommended][postgres_link])

Clone repo
  * `git clone https://github.com/civismtechteam/civism_backend`
  * cd into directory `cd civism_backend`

Install dependencies
  * `bundle install`

Setup database
  * `bundle exec rails db:setup`

Start development server
  * `bundle exec rails s`

Navigate to `localhost:3000/scoops/1` to ensure it's working!

[rbenv_link]: https://github.com/rbenv/rbenv
[postgres_link]: https://postgresapp.com
