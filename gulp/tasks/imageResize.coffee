gulp       = require 'gulp'
changed     = require 'gulp-changed'
filelog     = require 'gulp-filelog'
imageResize = require 'gulp-image-resize'

#imageresize用 resizeOptionsでサイズは指定
paths =
	srcDir: 'src'
	prvDir: 'prv'
	dstDir: 'prd'
	uploadsDir: '/uploads'
gulp.task 'image-optim:thumb', ->
	baseDir = paths.srcDir + paths.uploadsDir + '/origin'
	srcGlob = paths.srcDir + paths.uploadsDir + '/origin/**/*.+(jpg|jpeg|png|gif)'
	dstGlob = paths.dstDir + paths.uploadsDir + '/thumb'
	resizeOptions =
		width: 200
		height: 200
		gravity: 'Center'
		crop: true
		upscale: false
		imageMagick: true
	imageminOptions = optimizationLevel: 7
	gulp.src(srcGlob, base: baseDir)
	.pipe(changed(dstGlob))
	.pipe(imageResize(resizeOptions))
	.pipe(imagemin(imageminOptions))
	.pipe(gulp.dest(dstGlob))
	.pipe filelog()