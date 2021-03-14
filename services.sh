#!/bin/bash

chmod -R 777 /var/www/backend/tmp/cache
chmod -R 777 /var/www/backend/log
chmod -R 777 /var/www/backend/db/schema.rb
rm -rf /var/www/backend/tmp/pids/*

export DISABLE_SPRING=1
export RAILS_LOG_TO_STDOUT=1

bundle install
bundle exec rails db:create
bundle exec rails db:migrate

bundle exec rails s -p 3000 -b '0.0.0.0'

