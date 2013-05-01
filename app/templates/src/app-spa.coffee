# includes
express =     require('express')
rjs =         require('rjs').installPrototypes()
config =      require('./config.js').config

# create app and set middleware
app = express()
app.set 'view engine', 'jade'
app.set 'views', __dirname + '/views'
app.use express.logger('dev')
app.use express.bodyParser()
app.use express.cookieParser()
app.use express.session(secret: config.sessionSecret)
app.use express.static(__dirname + '/public')

###
Serializes the view data for bootstrapping and renders with the 'layout' view.
Sends the raw JSON if 'format=json'.
###
render = (req, res, viewData) ->
  if req.query.format is 'json'
    res.send viewData
  else
    viewData.seed = JSON.stringify(viewData.seed)
    res.render 'layout', viewData

# controller
app.get '/', (req, res) ->
  render req, res, 
    title: 'Project Name'
    seed:
      view: 'index'

app.get '/:page', (req, res) ->
  render req, res, 
    title: 'Project Name'
    seed:
      view: req.params.page

# start
app.listen process.env.PORT, ->
  console.log 'Listening on port ' + process.env.PORT

# export globals
exports.app = app