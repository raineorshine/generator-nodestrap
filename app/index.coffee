util = require("util")
path = require("path")
yeoman = require("yeoman-generator")

NodestrapGenerator = module.exports = (args, options, config) ->
  yeoman.generators.Base.apply this, arguments
  @on "end", ->
    @installDependencies skipInstall: options["skip-install"]

  @pkg = JSON.parse(@readFileAsString(path.join(__dirname, "../package.json")))

util.inherits NodestrapGenerator, yeoman.generators.NamedBase

NodestrapGenerator::askFor = ->
  cb = @async()
  
  prompts = [
    name: "spa"
    message: "Generate a single page application?"
    default: "Y/n"
  ]

  @prompt prompts, (err, props) ->
    return @emit("error", err)  if err
    @spa = (/y/i).test(props.spa)
    cb()
  .bind(this)

NodestrapGenerator::app = ->
  @copy "_package.json", "package.json"
  @copy "_component.json", "component.json"
  @copy "Gruntfile.coffee", "Gruntfile.coffee"
  @copy "Procfile", "Procfile"

NodestrapGenerator::views = ->
  layoutType = if @spa then 'spa' else 'default'
  @copy "views/layout-#{layoutType}.jade", "views/layout.jade"
