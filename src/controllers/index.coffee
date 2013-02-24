render = require('./controller-helper.js').render
module.exports = (app) ->

  app.get '/', (req, res) ->
    viewData =
      title: 'TITLE'
      seed:
        view: 'index'
        data: {}

    render req, res, viewData
