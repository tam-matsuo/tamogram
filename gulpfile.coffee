gulp             = require 'gulp'
plumber          = require 'gulp-plumber'
sass             = require 'gulp-sass'
sourcemaps       = require 'gulp-sourcemaps'
pleeease         = require 'gulp-pleeease'
hologram         = require 'gulp-hologram'
browserSync      = require 'browser-sync'


# SCSS
gulp.task 'styles', ->
  gulp.src './tamogram/styles/*.scss'
    .pipe plumber()
    .pipe sourcemaps.init()
    .pipe sass().on 'error', sass.logError
    .pipe pleeease()
    .pipe sourcemaps.write '.'
    .pipe gulp.dest './tamogram/assets/css/'

  # hologram
  gulp.src './hologram_config.yml'
    .pipe hologram()


#
# build assets (css, javascript)
#
gulp.task 'build', ['styles']


#
# Watch
#
gulp.task 'watch', ->
  gulp.watch 'tamogram/**/!(._)*.scss', ['styles']


#
# start BrowserSync / LiveReload
#
gulp.task 'serve', ['watch'], ->
  browserSync
    notify: false,
    port: 9000,
    server:
      baseDir: './styleguide/'

  gulp.watch [
    './styleguide/*.html'
  ]
  .on 'change', browserSync.reload


gulp.task 'default', ['build', 'serve']
