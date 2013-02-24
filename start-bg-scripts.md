# copy and paste these into the shell so they become background jobs
stylus public/style/ -w &
coffee -o ./ -cw src/ &
coffee -o public/scripts/out/ -cw public/scripts/src/ &
mongod &

# then 'foreman start' to launch the app!