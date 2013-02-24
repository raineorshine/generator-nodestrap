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
  |- controllers
  |- models
  |- lib      // 3rd party libraries
  |- src      // coffee input
    |- controllers
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

# to start the app
* npm install
* bower install
* copy and run the shell commands from 'start-bg-scripts.md'
* foreman start
