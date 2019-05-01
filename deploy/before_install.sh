cd /home/ubuntu/civism_backend
# stop server
kill -INT $(cat tmp/pids/server.pid)
# kill db
RAILS_ENV=production rails db:drop
