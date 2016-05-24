gulp       = require 'gulp'
watch      = require 'gulp-watch'

paths = require '../paths'

gulp.task 'watch', ->
	gulp.watch [paths.stylusPath + '/*.styl',paths.stylusPath + '/_partial/*.styl'], ['stylusReload']
	gulp.watch ['src/jade/**/*.jade', 'src/jade/**/_*.jade'], ['jadeReload','htmlprettify']
	gulp.watch ['src/js/*.js'], ['jsReload','vue']
	gulp.watch ['src/js/lib/*.js'], ['jsBundle' ,'bsReload']
	gulp.watch ['src/img/*.+(jpg|jpeg|png|gif|svg)','src/img/**/*.+(jpg|jpeg|png|gif|svg)'], ['imgclean','copyimg']

