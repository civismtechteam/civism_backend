cd /home/ubuntu/civism_backend
# stop server
kill -INT $(cat tmp/pids/server.pid)
# kill db
DISABLE_DATABASE_ENVIRONMENT_CHECK=1 RAILS_ENV=production rails db:drop
