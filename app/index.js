'use strict';
var util = require('util');
var path = require('path');
var yeoman = require('yeoman-generator');


var NodestrapGenerator = module.exports = function NodestrapGenerator(args, options, config) {
  yeoman.generators.Base.apply(this, arguments);

  this.on('end', function () {
    this.installDependencies({ skipInstall: options['skip-install'] });
  });

  this.pkg = JSON.parse(this.readFileAsString(path.join(__dirname, '../package.json')));
};

util.inherits(NodestrapGenerator, yeoman.generators.NamedBase);

NodestrapGenerator.prototype.askFor = function askFor() {
  var cb = this.async();

  // welcome message
  var welcome =
  '\n     _-----_' +
  '\n    |       |' +
  '\n    |' + '--(o)--'.red + '|   .--------------------------.' +
  '\n   `---------´  |    ' + 'Welcome to Yeoman,'.yellow.bold + '    |' +
  '\n    ' + '( '.yellow + '_' + '´U`'.yellow + '_' + ' )'.yellow + '   |   ' + 'ladies and gentlemen!'.yellow.bold + '  |' +
  '\n    /___A___\\   \'__________________________\'' +
  '\n     |  ~  |'.yellow +
  '\n   __' + '\'.___.\''.yellow + '__' +
  '\n ´   ' + '`  |'.red + '° ' + '´ Y'.red + ' `\n';

  console.log(welcome);

  var prompts = [{
    name: 'markup',
    message: 'Where would you like your markup? server (jade), or client (creatable, single page app)?',
    default: 'SERVER/client'
  }];

  this.prompt(prompts, function (err, props) {
    if (err) {
      return this.emit('error', err);
    }

    this.promptAppType = props.markup.toLowerCase() == 'client' ? 'spa' : 'default';

    cb();
  }.bind(this));
};

NodestrapGenerator.prototype.app = function app() {
  this.copy('Procfile', 'Procfile');
  this.copy('Gruntfile.coffee', 'Gruntfile.coffee');
  this.copy('_package.json', 'package.json');
  this.copy('_gitignore', '.gitignore');
  this.write('.env', 'PORT=' + (8001 + Math.floor(Math.random()*999))); // random port between 8001-8999
};

NodestrapGenerator.prototype.bower = function bower() {
  this.copy('_bowerrc', '.bowerrc');
  this.copy('component-' + this.promptAppType + '.json', 'component.json');
};

NodestrapGenerator.prototype.publicFiles = function publicFiles() {
  this.mkdir('public');
  this.directory('public/styles', 'public/styles');
  if(this.promptAppType == 'spa') {
    this.directory('public/scripts');
  }
  else {
    this.mkdir('public/scripts');
  }
};

NodestrapGenerator.prototype.src = function src() {
  this.mkdir('src');
  this.copy('src/config.coffee', 'src/config.coffee');
  this.copy('src/app-' + this.promptAppType + '.coffee', 'src/app.coffee');
};

NodestrapGenerator.prototype.views = function views() {
  this.mkdir('views');
  this.copy('views/layout-' + this.promptAppType + '.jade', 'views/layout.jade');
  if(this.promptAppType == 'default') {
    this.copy('views/index.jade', 'views/index.jade');
  }
};
