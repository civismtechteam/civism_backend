# create, migrate, seed db
RAILS_ENV=production rails db:setup
# start server
rails s --environment=production -p 80
