gulp       = require 'gulp'
del = require 'del'

prettify = require 'gulp-prettify'
cssmin = require 'gulp-cssmin'
concat  = require 'gulp-concat'
uglify  = require 'gulp-uglify'
jsonminify = require 'gulp-jsonminify'
imagemin = require 'gulp-imagemin'

paths = require '../paths'


gulp.task 'htmlprettify', ->
	gulp.src ['dist/*.html' , 'dist/**/*.html']
	.pipe prettify({indent_size: 2})
	.pipe gulp.dest('./build')

gulp.task 'cssmin', ->
	gulp.src [paths.distCss + '/*.css']
	.pipe concat('style.css')
	.pipe cssmin()
	.pipe gulp.dest(paths.buildCss)

gulp.task 'jsmin', ->
	gulp.src [paths.distJs + '/*.js']
	.pipe uglify(preserveComments: 'some')
	.pipe gulp.dest(paths.buildJs)

gulp.task 'jsBundle', ->
	gulp.src ['./src/js/lib/*.js']
	.pipe concat('bundle.min.js')
	.pipe uglify(preserveComments: 'some')
	.pipe gulp.dest(paths.distJs + '/lib')

gulp.task 'buildJsBundle', ->
	gulp.src (paths.distJs + '/lib/bundle.min.js')
	.pipe gulp.dest('build/js/lib/')

gulp.task 'imagemin', ->
	dstGlob = paths.buildImg;
	imageminOptions = optimizationLevel: 7
	gulp.src [paths.srcImg + '/**/*.+(jpg|jpeg|png|gif|svg)','!' + paths.srcImg + '/sprite/*.+(jpg|jpeg|png|gif|svg)']
	.pipe imagemin(imageminOptions)
	.pipe gulp.dest(dstGlob)
	.pipe gulp.dest('dist/img/')

gulp.task 'copyimg', ->
	gulp.src ['src/img/**']
	.pipe gulp.dest('dist/img')

gulp.task 'distjson', ->
	gulp.src ('src/data/*.json')
	.pipe jsonminify()
	.pipe gulp.dest('dist/data')

gulp.task 'json', ->
	gulp.src('src/data/*.json')
	.pipe jsonminify()
	.pipe gulp.dest('./build/data')

gulp.task 'copyfont', ->
	gulp.src ('src/font/**')
	.pipe gulp.dest('dist/font')
	.pipe gulp.dest('build/font')



gulp.task 'imgclean', ->
	del(['dist/img/*.+(jpg|jpeg|png|gif|svg)','dist/img/**/*.+(jpg|jpeg|png|gif|svg)','!' + 'dist/img/sprite/**'])
gulp.task 'cleanDir', ->
	del('./build/*')


