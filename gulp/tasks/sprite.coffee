gulp       = require 'gulp'
plumber = require 'gulp-plumber' #エラー時に止めない

spritesmith = require 'gulp.spritesmith'

paths = require '../paths'

#sprite
gulp.task 'spriteStylus', ->
	spriteData = gulp.src 'src/img/sprite/*.png'
	.pipe plumber()
	.pipe spritesmith
		imgName: 'sprite.png',
		cssName: 'sprite.styl',
		algorithm: 'binary-tree',
		padding: 5,
		cssFormat: 'stylus'
	spriteData.img
	.pipe gulp.dest('dist/img/')
	spriteData.css
	.pipe gulp.dest(paths.stylusPath + '/_partial');

