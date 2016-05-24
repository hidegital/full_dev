gulp       = require 'gulp'
plumber = require 'gulp-plumber' #エラー時に止めない
runSequence = require 'run-sequence'

del = require 'del'
header  = require 'gulp-header'

stylus = require 'gulp-stylus'
pleeease = require 'gulp-pleeease' #autoprefixer
csscomb = require 'gulp-csscomb'
cssmin = require 'gulp-cssmin'
sourcemaps = require 'gulp-sourcemaps'
uncss = require 'gulp-uncss'
jeet  = require 'jeet'
axis = require 'axis'
paths = require '../paths'


gulp.task 'stylus', ->
	gulp.src [paths.stylusPath + '/*.styl','!' + paths.stylusPath + '/_*/*.styl']
	.pipe plumber()
#    .pipe sourcemaps.init()
	.pipe stylus(
		use:[
			axis(),
			jeet(),
		]
	)
#    .pipe sourcemaps.write()
	.pipe pleeease(
		minifier: false,
		autoprefixer: {"browsers": ["last 4 versions"]}
	)
	.pipe csscomb()
#	uncss 癖あるがすげえ
#	.pipe uncss(
#		html: ['./dist/*.html','./dist/**/*.html']
#		ignore: [/.is-/,/.grid_/,'a',/.menu/,/.slide-/,/.category/,/.new/,/i/,/h/,/.remodal/,/.bx-/]
#	)
	.on('error', console.error.bind(console))
	.pipe (header('@charset "utf-8";\n'))
	.pipe (gulp.dest(paths.distCss))


gulp.task 'cleanCss', ->
	del('./dist/css/*.css')

gulp.task 'stylusReload', (callback) ->
	runSequence 'cleanCss','stylus', 'bsReload', callback
