gulp       = require 'gulp'
paths = require '../paths'

#vue
gulp.task 'vue', ->
	gulp.src ('./src/js/vue_form_valid.js')
	.pipe gulp.dest paths.distJs
