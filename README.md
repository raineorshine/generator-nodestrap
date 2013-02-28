# server-side

* Procfile
* node
* coffee
* stylus
* express
* mongodb
* underscore
* rjs
* jade
* requiredir
* async
* bower


# client-side

* twitter bootstrap
* underscore
* backbone
* rjs
* creatable
* creatable.backbone

# directory structure

root          // coffee output (NOTE: different than client-side because app.js needs to be relative to root)
  |- models
  |- lib      // 3rd party libraries
  |- src      // coffee input
    |- models
  |- view     // jade templates
  |- public
    |- components
    |- img
    |- style
    |- scripts
       |- lib     // 3rd party libraries
       |- out     // coffee output
       |- src     // coffee input

# setup
npm install
bower install

# background jobs
stylus public/style/ -w &
coffee -o ./ -cw src/ &
coffee -o public/scripts/out/ -cw public/scripts/src/ &
mongod &

# start app
foreman start
