Scaffolding for a Heroku-ready, coffee-fueled web stack: **node + bower + bootstrap + backbone + creatable**

    npm install && bower install && grunt
    foreman start

*port specified in .env file (default: 5001)*

# What's Included
## server-side (npm)

* express
* mongodb
* underscore
* rjs
* jade
* async

## client-side (bower)

* bootstrap
* underscore
* backbone
* jQuery
* rjs
* creatable

## global dependencies

* node
* npm
* grunt-cli
* bower
* coffee
* stylus
* mongod
* foreman

# directory structure

    root
      |- public
        |- components
        |- images
        |- styles
        |- scripts
           |- compiled
           |- src
      |- src
        |- models
      |- view

# Helpful Commands
## Background Jobs
(this should get moved to a grunt watch task)

    stylus public/styles/ -w &
    coffee -o ./ -cw src/ &
    coffee -o public/scripts/compiled -cw public/scripts/src/ &
    mongod &

## tasks

    grunt compile
    grunt concat
    grunt uglify
    grunt clean
    grunt

