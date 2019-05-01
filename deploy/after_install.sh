# install gems
bundle install
# create, migrate, seed db
RAILS_ENV=production rails db:setup
# start server
RAILS_ENV=production rails s --environment=production -p 80 -d
