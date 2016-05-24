gulp       = require 'gulp'
browserSync = require 'browser-sync'


gulp.task 'browserSync', ->
	browserSync
		notify: false,
		port: 3000,
		server: {
			baseDir: ['./dist/']
		}
gulp.task 'bsReload', ->
	browserSync.reload()