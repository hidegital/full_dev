gulp       = require 'gulp'
runSequence = require 'run-sequence'
browserify = require 'browserify'
watchify   = require 'watchify' #browserifyのコンパイルを早くする
babelify = require 'babelify'
source     = require 'vinyl-source-stream' #gulp で Browserify を扱う際に利用

paths = require '../paths'

#js
gulp.task 'js', ->
	browserify
		entries: [
			'./src/js/app.js'
		]
	.transform babelify, { presets: ['es2015', 'react']}
	.bundle()
	.pipe source 'app.js'
	.pipe gulp.dest paths.distJs

gulp.task 'jsReload', (callback) ->
	runSequence 'js', 'bsReload', callback
