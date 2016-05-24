gulp       = require 'gulp'
runSequence = require 'run-sequence'
plumber = require 'gulp-plumber' #エラー時に止めない
data = require 'gulp-data'

jade = require 'gulp-jade'
htmlhint = require 'gulp-htmlhint'
prettify = require 'gulp-prettify'

paths = require '../paths'

gulp.task 'jade', ->
	gulp.src ["src/jade/**/*.jade",'!' + "src/jade/**/_*.jade"]
	.pipe(data((file) ->
		require '../../src/data/list.json'
	))
	.pipe plumber()
	.pipe jade(
		pretty: true
	)
	.pipe gulp.dest paths.DEST

gulp.task 'jadeReload', (callback) ->
	runSequence 'jade', 'bsReload', callback


gulp.task 'htmlhint', ->
	gulp.src('./dist/*.html')
	.pipe htmlhint()
	.pipe htmlhint.reporter()
