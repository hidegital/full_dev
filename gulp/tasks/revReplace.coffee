gulp       = require 'gulp'

#cash用
rev = require 'gulp-rev'
revReplace = require 'gulp-rev-replace'
useref = require 'gulp-useref'
gulpif = require 'gulp-if'

#cssファイルに乱数を付与
#dist以下にrev-manifest.jsonが生成
#task revreplaceでjson内の名前に変更
gulp.task 'index', ->
	gulp.src([
		'dist/css/*.css'
		'dist/css/**/*css'
		'dist/js/*.js'
		'dist/js/**/*.js'
	], base: 'dist')
	.pipe(gulp.dest('dist'))
	.pipe(rev())
	.pipe(gulp.dest('build/'))
	.pipe(rev.manifest())
	.pipe gulp.dest('dist')

gulp.task 'revreplace', ->
	manifest = gulp.src('./dist' + '/rev-manifest.json')
	gulp.src('./dist' + '/index.html')
	.pipe(revReplace(manifest: manifest))
	.pipe gulp.dest('./build')