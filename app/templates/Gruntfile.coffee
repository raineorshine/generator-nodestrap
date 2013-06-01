module.exports = (grunt) ->
  
  # Project configuration.
  grunt.initConfig

    shell:
      'compile-server-side':
        options: stdout: true
        command: 'coffee -o ./ -c src/'
      'compile-client-side':
        options: stdout: true
        command: 'coffee -o public/scripts/compiled/ -c public/scripts/src/'
      'compile-css':
        options: stdout: true
        command: 'stylus public/styles/'
      'dev-out':
        options: stdout: true
        command: 'cp public/scripts/out.js public/scripts/out.min.js'
      static:
        options: stdout: true
        command: 'mkdir -p static && curl http://localhost:5001 >> static/index.html'
      sprite:
        options: stdout: true
        command: 'glue public/images/sprites --crop --img=public/images --css=public/styles --sprite-namespace= ' + 
          """--global-template=".sprite{display:inline-block;background-image:url('%(sprite_url)s');background-repeat:no-repeat}\n" """

    concat:
      js:
        options:
          separator: ';'
        src: ['public/scripts/compiled/*.js', 'public/scripts/compiled/views/*.js']
        dest: 'public/scripts/out.js'
      css:
        src: 'public/styles/*.css'
        dest: 'public/styles/out.css'

    uglify:
      build:
        src: 'public/scripts/out.js'
        dest: 'public/scripts/out.min.js'

    clean:
      js: ['*.js', 'public/scripts/compiled/', 'public/scripts/*.js']
      css: 'public/styles/*.css'
      components: 'public/components'
      npm: 'node_modules'
      static: 'static'
      sprite: ['public/images/sprites.png', 'public/styles/sprites.css']

  
  # Plugins
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-shell'

  # Tasks
  grunt.registerTask 'default', ['compile', 'sprite', 'concat', 'uglify']
  grunt.registerTask 'dev', ['compile', 'concat', 'shell:dev-out']
  grunt.registerTask 'compile', ['shell:compile-server-side', 'shell:compile-client-side', 'shell:compile-css']
  grunt.registerTask 'static', ['shell:static']
  grunt.registerTask 'sprite', ['shell:sprite']
