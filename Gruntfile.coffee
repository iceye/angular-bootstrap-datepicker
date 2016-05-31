module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    clean: ['bower_components', 'node_modules']

    concat:
      js:
        src: ['bower_components/bootstrap-datepicker/js/bootstrap-datepicker.js',
          'bower_components/bootstrap-datepicker/js/locales/*.js',
          'src/angular-bootstrap-datepicker-directive.js']

        dest: 'dist/angular-bootstrap-datepicker.js'
      css:
        src: ['bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.css']
        dest: 'dist/angular-bootstrap-datepicker.css'

    uglify:
      options:
        mangle: false
      main:
        files:
          'dist/angular-bootstrap-datepicker.min.js': ['dist/angular-bootstrap-datepicker.js']

    watch:
      options:
        livereload: true
        spawn: false
        debounceDelay: 50
        atBegin: true
      concat:
        files: 'src/**/*.js'
        tasks: ['concat', 'uglify:main']

    cssmin:
      dist:
        files:
          'dist/angular-bootstrap-datepicker.min.css': ['dist/angular-bootstrap-datepicker.css']

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
