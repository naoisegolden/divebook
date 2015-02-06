# Divebook

[![Build Status](https://secure.travis-ci.org/naoisegolden/divebook.png)](http://travis-ci.org/naoisegolden/divebook) [![Code Climate](https://codeclimate.com/github/naoisegolden/divebook/badges/gpa.svg)](https://codeclimate.com/github/naoisegolden/divebook) [![Test Coverage](https://codeclimate.com/github/naoisegolden/divebook/badges/coverage.svg)](https://codeclimate.com/github/naoisegolden/divebook)

Divebook is a project under development. Not much more to see. <a href="https://plus.google.com/103700467070879436555/" rel="author">By Naoise Golden</a>

## Install & config

Needs Ruby 2.2.0, Rails 4.2 and PostgreSQL (using 9.2.1).

    $ git clone git@github.com:naoisegolden/divebook.git & cd divebook
    $ bundle install
    $ rake db:create
    $ rake db:migrate

    $ heroku login
    $ heroku git:remote -a divebook
    $ heroku keys:add

Create file `./config/app_environment_variables.rb` and define the needed environment variables. Change DB settings in `./config/database.yml` and put your username.

If PostgreSQL needs to be installed:

    $ brew install postgres
    $ initdb /usr/local/var/postgres

## Run

    $ rails server

To start the PostgreSQL server:

    $ pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start

## Deploy

    $ git push heroku master

If a migration file has been pushed:

    $ heroku run rake db:migrate

