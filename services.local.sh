#!/bin/bash

rm -rf /var/www/backend/tmp/pids/*
export RAILS_ENV=development

export DISABLE_SPRING=1
export RAILS_LOG_TO_STDOUT=1

bundle install
#bundle exec rails db:seed_fu
#bundle exec rake "store_estimate_request_template[1]"

bundle exec foreman start -f Procfile.dev