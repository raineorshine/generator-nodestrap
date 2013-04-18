# server-side (npm)

* express
* mongodb
* underscore
* rjs
* jade
* async

# client-side (bower)

* bootstrap
* underscore
* backbone
* rjs
* creatable

# directory structure

  root
    |- public
      |- components
      |- images
      |- styles
      |- scripts
         |- src
    |- src
      |- models
    |- view

# global dependencies

* node
* npm
* bower
* coffee
* stylus
* mongod
* foreman

# setup

  npm install
  bower install

# background jobs

  stylus public/styles/ -w &
  coffee -o ./ -cw src/ &
  coffee -o public/scripts/ -cw public/scripts/src/ &
  mongod &

# start app

  foreman start

# TODO

* add build system via grunt that includes minification
