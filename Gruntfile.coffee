module.exports = (grunt) ->

  grunt.initConfig

    pkg: grunt.file.readJSON('package.json')

    sass:
      dist:
        files: [
          expand: true
          cwd: 'src/scss'
          src: ['**/index.scss']
          dest: 'build/css'
          ext: '.css'
        ]

    coffee:
      dist:
        files: [
          expand: true
          cwd: 'src/coffee'
          src: '**/*.coffee'
          dest: 'build/js'
          ext: '.js'
        ]

    haml:
      dist:
        files: [
          expand: true
          cwd: 'src/haml'
          src: ['**/*.haml']
          dest: 'build/html'
          ext: '.html'
        ]

    watch:
      sass:
        files: 'src/scss/**/*.scss'
        tasks: ['sass']
      coffee:
        files: 'src/coffee/**/*.coffee'
        tasks: ['coffee']
      haml:
        files: 'src/haml/**/*.haml'
        tasks: ['haml']

    compress:
      main:
        options:
          archive: 'DevGib.zip'
        files: [
          {src: ['manifest.json', 'LICENSE'] },
          {src: ['build/**/*', 'lib/**/*', 'assets/**/*'] }
        ]

  grunt.loadNpmTasks('grunt-contrib-sass')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-haml')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-compress')

  grunt.registerTask('compile', ['sass', 'coffee', 'haml'])
  grunt.registerTask('default', ['compile'])